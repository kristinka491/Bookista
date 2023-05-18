//
//  GreetingView.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI

struct GreetingView: View {
    @StateObject var viewModel = GreetingViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("OnboardingBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    Spacer()
                        .frame(height: 300)
                    
                    HStack(spacing: 0) {
                        Text(StringConstants.getStartedViewTitle)
                            .font(.roboto(.regular, size: 25))
                            .foregroundColor(.getStartedViewTextColor)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    
                    HStack(spacing: 0) {
                        Text(StringConstants.getStartedViewTitleContinuation)
                            .font(.roboto(.regular, size: 25))
                            .foregroundColor(.mainColor)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    
                    HStack(spacing: 0) {
                        Text(StringConstants.getStartedViewSubtitle)
                            .font(.roboto(.regular, size: 15))
                            .foregroundColor(.getStartedViewTextColor)
                        Spacer()
                    }.padding(.bottom, 30)
                        .padding(.horizontal, 10)
                    
                    HStack(spacing: 10) {
                        Text(StringConstants.getStartedViewButtonTitle)
                            .font(.roboto(.bold, size: 15))
                            .foregroundColor(.getStartedViewTextColor)
                        
                        NavigationLink(destination: LoginView()) {
                            Image(systemName: "arrow.forward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .background(Color.mainColor)
                                .clipShape(Circle())
                                .onTapGesture {
                                    viewModel.isOnboarded = true
                                }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
