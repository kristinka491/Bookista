//
//  LoginViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI
import RealmSwift
import Combine

class LoginViewModel: ObservableObject {
    @AppStorage("isUserLogged") var isLogged = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    @Published var isShowError = false
    
    private let realmDataStore = RealmDataStore.shared
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        setUpValidations()
    }

    func getUser() {
        let user = realmDataStore.getUser(email: email, password: password)
        if user == nil {
            isShowError = true
        } else {
            isLogged = true
            clearFields()
        }
    }
    
    private func clearFields() {
        email = ""
        password = ""
    }
    
    private func setUpValidations() {
        Publishers.CombineLatest($email, $password).map { email, password in
            return !email.isEmpty && !password.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
}
