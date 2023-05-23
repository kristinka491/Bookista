//
//  AccountInformationViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-19.
//

import Foundation
import SwiftUI
import PhotosUI
import Realm

class AccountInformationViewModel: ObservableObject {
    @AppStorage("isUserLogged") var isLogged = true
    
    @Published var selectedItem: PhotosPickerItem?
    @Published var selectedImageData: Data?
    @Published var selectedImage: UIImage?
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: User?
    
    init() {
        loadUserInformation()
    }
    
    private let realmDataStore = RealmDataStore.shared
    private let localManager = LocalManager()
    
    func updateProfile() {
        localManager.deleteImage(imageName: user?.imageUrl)
        
        let avatarName = UUID().uuidString
        localManager.saveImage(image: selectedImage, imageName: avatarName)
        realmDataStore.updateProfile(name: firstName, lastName: lastName, avatarImageURL: avatarName)
    }
        
    func deleteUser(email: String) {
        if let email = user?.email {
            realmDataStore.deleteUser(with: email)
        }
        isLogged = false
    }
    
    private func loadUserInformation() {
        user = realmDataStore.getCurrentUser()
        firstName = user?.name ?? ""
        email = user?.email ?? ""
        
        let imageUrl = user?.imageUrl
        DispatchQueue.global(qos: .userInitiated).async {
            if let image = self.localManager.getSavedImage(imageName: imageUrl) {
                DispatchQueue.main.async {
                    self.selectedImage = image
                }
            }
        }
    }
}

