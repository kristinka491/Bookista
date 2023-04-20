//
//  RealmDataStore.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import Foundation
import RealmSwift

class RealmDataStore {
    
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
    
    private func saveObject(user: User) {
        try? realm?.write {
            realm?.add(user)
        }
        print("Data Was Saved To Realm Database.")
    }
}
