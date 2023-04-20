//
//  BookistaApp.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI

@main
struct BookistaApp: App {
    @AppStorage("isUserRemembered") var isRemembered = false
    @AppStorage("isUserLogged") var isLogged = false
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            if isRemembered && isLogged {
                HomeView()
            } else {
                GreetingView()
            }
        }
    }
}
