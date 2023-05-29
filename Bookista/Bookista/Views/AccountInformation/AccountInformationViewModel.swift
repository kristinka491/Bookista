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
import Combine

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
    @Published var isChanged = false
    @Published var isImageSet = false
    
    private let realmDataStore = RealmDataStore.shared
    private let localManager = LocalManager()
    private var publishers = Set<AnyCancellable>()
    
    init() {
        loadUserInformation()
        isUserInfoChanged()
    }
    
    func updateProfile() {
        let imageName = UUID().uuidString
        realmDataStore.updateProfile(name: firstName, lastName: lastName, avatarImageURL: imageName)
        
        if isImageSet {
            localManager.deleteImage(imageName: user?.imageUrl)
            localManager.saveImage(image: selectedImage, imageName: imageName)
        }
    }
        
    func deleteUser(email: String) {
        if let email = user?.email {
            realmDataStore.deleteUser(with: email)
        }
        isLogged = false
    }
    
    private func isUserInfoChanged() {
        Publishers.CombineLatest3($firstName, $lastName, $isImageSet).map { [weak self] firstName, lastName, isImageSet in
            return self?.user?.name != firstName || self?.user?.lastName != lastName || isImageSet
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isChanged, on: self)
        .store(in: &publishers)
    }
    
    private func loadUserInformation() {
        user = realmDataStore.getCurrentUser()
        firstName = user?.name ?? ""
        lastName = user?.lastName ?? ""
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

