//
//  TabbarItemEnum.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-15.
//

import Foundation
import SwiftUI

enum TabItem: Int, Identifiable, CaseIterable, Comparable {
    
    static func < (lhs: TabItem, rhs: TabItem) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home
    case bookshelf
    case settings
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .bookshelf:
            return "books.vertical"
        case .settings:
            return "gearshape"
        }
    }
    
    var color: Color {
        switch self {
        case .home, .bookshelf, .settings:
            return .tabbarItemColor
        }
    }
    
    var tag: String {
        switch self {
        case .home:
            return "Home"
        case .bookshelf:
            return "Bookshelf"
        case .settings:
            return "Settings"
        }
    }
    
    var page: any View {
        switch self {
        case .home:
            return HomeView()
        case .bookshelf:
            return BookshelfView()
        case .settings:
            return SettingsView()
        }
    }
}
