//
//  BookistaApp.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI

@main
struct BookistaApp: App {
    @AppStorage("isUserLogged") var isLogged = false
    @AppStorage("isUserOnboarded") var isOnboarded = false
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            if isLogged {
                TabbarView()
            } else if isOnboarded {
                LoginView()
            } else {
                GreetingView()
            }
        }
    }
}
