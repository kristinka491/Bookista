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
    case theSamepassword

    var title: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordTitle
        case .userIsRegistered:
            return StringConstants.userIsRegisteredTitle
        case .theSamepassword:
            return StringConstants.theSamePasswordTitle
        }
    }

    var message: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordMessage
        case .userIsRegistered:
            return StringConstants.userIsRegisteredMessage
        case .theSamepassword:
            return StringConstants.theSamePasswordMessage
        }
    }
}
