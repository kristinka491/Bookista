//
//  RealmCollection+Extension.swift
//  Bookista
//
//  Created by Krystsina on 2023-06-06.
//

import Foundation
import RealmSwift

extension RealmCollection {
    
    func toArray<T>() ->[T] {
        return self.compactMap { $0 as? T }
    }
}
