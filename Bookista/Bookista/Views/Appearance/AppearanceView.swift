//
//  AppearanceView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct AppearanceView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel

    var body: some View {
        Text("Hello")
            .onAppear {
            tabViewModel.isHiddenTabBar = true
        }
        .onDisappear {
            tabViewModel.isHiddenTabBar = false
        }
    }
}

struct AppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceView()
    }
}
