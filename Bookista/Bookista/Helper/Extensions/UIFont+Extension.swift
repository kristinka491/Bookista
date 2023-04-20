//
//  UIFont+Extension.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-18.
//

import Foundation

import SwiftUI

extension Font {
    enum NunitoSansFont {
        case regular
        case bold
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "NunitoSans-Regular"
            case .bold:
                return "NunitoSans-Bold"
            case .custom(let name):
                return name
            }
        }
    }

    static func nunito(_ type: NunitoSansFont, size: CGFloat = 13) -> Font {
        return .custom(type.value, size: size)
    }
    
    enum PoppinsFont {
        case regular
        case bold
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "Poppins-Regular"
            case .bold:
                return "Poppins-Bold"
            case .custom(let name):
                return name
            }
        }
    }

    static func poppins(_ type: PoppinsFont, size: CGFloat = 13) -> Font {
        return .custom(type.value, size: size)
    }
    
    enum RobotoFont {
        case regular
        case bold
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "Roboto-Regular"
            case .bold:
                return "Roboto-Bold"
            case .custom(let name):
                return name
            }
        }
    }

    static func roboto(_ type: PoppinsFont, size: CGFloat = 13) -> Font {
        return .custom(type.value, size: size)
    }
    
}
