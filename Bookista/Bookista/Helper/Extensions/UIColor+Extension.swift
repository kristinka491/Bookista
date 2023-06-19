//
//  UIColor+Extension.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-18.
//

import Foundation

import SwiftUI


extension Color {
    
    static let mainColor = Color.hexStringToColor(hex: "#F9399B")
    static let getStartedViewAdditionalButtonColor = Color.hexStringToColor(hex: "CE3784")
    static let getStartedViewTextColor = Color.hexStringToColor(hex: "C9A98D")
    static let tabbarItemColor = Color.hexStringToColor(hex: "E7388A")
    static let backgroundColor = Color.hexStringToColor(hex: "FFF6EA")
    static let disabledButtonColor = Color.hexStringToColor(hex: "#EFC3D8")
    static let disabledTextFieldColor = Color.hexStringToColor(hex: "#F8F3EF")
    static let firstCardBackgroundColor = Color.hexStringToColor(hex: "E4D9D7") 
    static let secondCardBakgroundColor = Color.hexStringToColor(hex: "E0D2D1")
    static let thirdCardBackgroundColor = Color.hexStringToColor(hex: "F5D5D2")
    static let fourthCardBackgroundColor = Color.hexStringToColor(hex: "EAD0D6")
    
    static func hexStringToColor(hex: String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return Color(UIColor.gray)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return Color(UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                             alpha: CGFloat(1.0)))
    }
}
