//
//  AccountInformationView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct AccountInformationView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel

    var body: some View {
        ZStack() {
            Text("Hello, Worl")
        }
        .onAppear {
            tabViewModel.isHiddenTabBar = true
        }
        .onDisappear {
            tabViewModel.isHiddenTabBar = false
        }
    }
}

struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
    }
}
