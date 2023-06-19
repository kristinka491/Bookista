//
//  UserCard.swift
//  Bookista
//
//  Created by Krystsina on 2023-06-01.
//

import Foundation
import RealmSwift

class UserCard: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var cardNumber = ""
    @Persisted var nameOnCard = ""
    @Persisted var expirationDate = ""
    @Persisted var CVV = ""
}

