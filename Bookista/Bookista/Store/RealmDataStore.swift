//
//  RealmDataStore.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmDataStore {
    @AppStorage("currentUserLogin") var currentUserLogin: String?
    
    static let shared = RealmDataStore()
    private let realm = try? Realm()
    
    func addUser(name: String,
                 email: String,
                 password: String) -> Bool {
        if !isUserRegistered(with: email) {
            let user = User()
            user.name = name
            user.email = email
            user.password = password
            saveObject(user: user)

            return true
        }
        return false
    }
    
    func getUser(email: String, password: String) -> User? {
        if let user = getUser(with: email),
           user.password == password {
            return user
        }
        return nil
    }
    
    func getUser(with email: String) -> User? {
        let user = realm?.object(ofType: User.self,
                                 forPrimaryKey: email)
        return user
    }

    func isUserRegistered(with email: String) -> Bool {
        return getUser(with: email) != nil
    }
    
    func getCurrentUser() -> User? {
        if let currentUserLogin = currentUserLogin {
            return getUser(with: currentUserLogin)
        }
        return nil
    }
    
    func deleteUser(with login: String) {
        if let user = realm?.object(ofType: User.self,
                                    forPrimaryKey: login) {
            try? realm?.write {
                realm?.delete(user)
            }
        }
    }
    
    func updateProfile(name: String,
                       lastName: String,
                       avatarImageURL: String?) {
        let currentUser = getCurrentUser()

        try? realm?.write {
            currentUser?.name = name
            currentUser?.lastName = lastName
            if let avatarImageURL = avatarImageURL {
                currentUser?.imageUrl = avatarImageURL
            }
        }
    }

    private func saveObject(user: User) {
        try? realm?.write {
            realm?.add(user)
        }
        print("Data Was Saved To Realm Database.")
    }
    
}
