//
//  User.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-20.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var email = ""
    @Persisted var name = ""
    @Persisted var password = ""
}
