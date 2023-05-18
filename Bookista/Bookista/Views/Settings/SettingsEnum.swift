//
//  ProfileSettingsEnum.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import Foundation
import SwiftUI

enum SettingsEnum: CaseIterable {
    case accountInformation
    case notifications
    case paymentMethods
    case appearance
    case purchases
    case logout
    
    var title: String? {
        switch self {
        case .accountInformation:
            return StringConstants.profileViewAccountInformation
        case .notifications:
            return StringConstants.profileViewNotification
        case .paymentMethods:
            return StringConstants.profileViewPaymentMethods
        case .appearance:
            return StringConstants.profileViewAppearance
        case.purchases:
            return StringConstants.profileViewPurchases
        case .logout:
            return StringConstants.profileViewLogOut
        }
    }
    
    var imageName: String? {
        switch self {
        case .accountInformation:
            return "person"
        case .notifications:
            return "bell"
        case .paymentMethods:
            return "creditcard"
        case .appearance:
            return "gear"
        case .purchases:
            return "cart"
        case .logout:
            return "rectangle.portrait.and.arrow.right"
        }
    }
    
    var nextView: AnyView? {
        switch self {
        case .accountInformation:
            return AnyView(AccountInformationView())
        case .notifications:
            return AnyView(NotificationsView())
        case .paymentMethods:
            return AnyView(PaymentMethodsView())
        case .appearance:
            return AnyView(AppearanceView())
        case .purchases:
            return AnyView(PurchasesView())
        case .logout:
            return nil
        }
    }
}
