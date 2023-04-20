//
//  DataError.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import Foundation

enum DataError {
    case wrongUsernameOrPassword
    case userIsRegistered

    var title: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordTitle
        case .userIsRegistered:
            return StringConstants.userIsRegisteredTitle
        }
    }

    var message: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordMessage
        case .userIsRegistered:
            return StringConstants.userIsRegisteredMessage
        }
    }
}
