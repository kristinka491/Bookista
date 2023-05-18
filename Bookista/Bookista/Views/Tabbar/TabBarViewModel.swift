//
//  TabBarViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-15.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var pages: [TabItem]
    @Published var isHiddenTabBar: Bool = false
    
    init() {
        pages = TabItem.allCases
    }
}
