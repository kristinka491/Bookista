//
//  PurchasesView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct PurchasesView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel

    var body: some View {
        Text("He")
            .onAppear {
                tabViewModel.isHiddenTabBar = true
            }
            .onDisappear {
                tabViewModel.isHiddenTabBar = false
            }
    }
}

struct PurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesView()
    }
}
