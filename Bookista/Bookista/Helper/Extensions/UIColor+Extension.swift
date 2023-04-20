//
//  UIColor+Extension.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-18.
//

import Foundation

import SwiftUI


extension Color {
    
    static let accentColor = Color.hexStringToColor(hex: "#F9399B")
    static let getStartedViewAdditionalButtonColor = Color.hexStringToColor(hex: "CE3784")
    static let getStartedViewTextColor = Color.hexStringToColor(hex: "C9A98D")
    static let disableButtonColor = Color.hexStringToColor(hex: "F28FC1")
    
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
