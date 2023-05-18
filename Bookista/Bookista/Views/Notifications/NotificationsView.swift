//
//  NotificationsView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel

    var body: some View {
        Text("Hello, World")
            .onAppear {
                tabViewModel.isHiddenTabBar = true
            }
            .onDisappear {
                tabViewModel.isHiddenTabBar = false
            }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
