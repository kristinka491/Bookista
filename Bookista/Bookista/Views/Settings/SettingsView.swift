//
//  ProfileView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-15.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel
    @StateObject var viewModel = SettingsViewModel()
   
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        HStack(spacing: 0) {
                            Text(StringConstants.profileViewTitle)
                                .foregroundColor(.mainColor)
                                .font(.poppins(.regular, size: 30))
                            
                            Spacer()
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 20)
                        
                        
                        HStack(spacing: 0) {
                            Text(StringConstants.profileViewGeneral)
                                .foregroundColor(.getStartedViewTextColor)
                                .font(.poppins(.regular, size: 20))
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(viewModel.profileSettings, id: \.title) { item in
                                if let nextView = item.nextView {
                                    NavigationLink(destination: nextView.environmentObject(tabViewModel)) {
                                        SettingCell(item: item)
                                    }
                                } else {
                                    SettingCell(item: item)
                                        .onTapGesture {
                                            viewModel.isLogged = false
                                        }
                                }
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.bottom, 60)
            }
            .onAppear {
                tabViewModel.isHiddenTabBar = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
                .environmentObject(TabBarViewModel())
        
    }
}
