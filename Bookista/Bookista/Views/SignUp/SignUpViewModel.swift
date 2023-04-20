//
//  SignUpViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import Foundation
import RealmSwift
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    
    @Published var isValid = false
    @Published var isEmailValid = false
    @Published var isShowError = false
    @Published var isRegistered = false
    
    private let realmDataStore = RealmDataStore.shared
    private var publishers = Set<AnyCancellable>()
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        setUpValidations()
    }
    
    func saveUser() {
        let isUserRegistered = realmDataStore.addUser(name: name, email: email, password: password)
        if !isUserRegistered {
            isShowError = true
        } else {
            isRegistered = true
            clearFields()
        }
    }
    
    private func clearFields() {
        email = ""
        name = ""
        password = ""
    }
    
    private func setUpValidations() {
        $email
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return email.isEmpty ? true : emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &publishers)
        
        Publishers.CombineLatest($email, $isEmailValid).map { mail, isValid in
            return mail.isEmpty || !isValid
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &publishers)
        
        Publishers.CombineLatest3($email, $name, $password).map { email, name, password in
            return !email.isEmpty && !name.isEmpty && !password.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
}
