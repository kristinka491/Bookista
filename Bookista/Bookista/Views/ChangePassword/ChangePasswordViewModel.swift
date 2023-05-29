//
//  ChangePasswordViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-24.
//

import Foundation
import Combine

class ChangePasswordViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var user: User?
    @Published var isShowTheSamePasswordError = false
    @Published var isConfirmed = false
    
    private let realmDataStore = RealmDataStore.shared
    private var publishers = Set<AnyCancellable>()
    
    init() {
        loadUserInfo()
        isUserInfoChanged()
    }
    
    var isChangedPassword: Bool {
        let isChanged = realmDataStore.isChangedPassword(with: password)
        isShowTheSamePasswordError = !isChanged
        
        return isChanged
    }
    
    private func isUserInfoChanged() {
        Publishers.CombineLatest($password, $confirmPassword).map { password, confirmPassword in
            return !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isConfirmed, on: self)
        .store(in: &publishers)
    }
    
    private func loadUserInfo() {
        user = realmDataStore.getCurrentUser()
    }
}
