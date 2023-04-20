//
//  LoginView.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
   
    var body: some View {
        NavigationStack {
            ZStack() {
                Image("LoginAndSignUpBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    Text(StringConstants.loginViewTitle)
                        .font(.roboto(.regular, size: 30))
                        .foregroundColor(.accentColor)
                        .padding(.bottom, 40)
                    
                    AuthorizationTextField(placeHolder: StringConstants.loginViewEmailTitle, imageName: "envelope", text: $viewModel.email)
                    AuthorizationTextField(placeHolder: StringConstants.loginViewPasswordTitle, imageName: "lock", text: $viewModel.password)
                        .padding(.bottom, -10)
                    
                    HStack(spacing: 10) {
                        Image(systemName: viewModel.isRemembered ? "checkmark.circle" : "circle")
                            .foregroundColor(.accentColor)
                        
                        Text(StringConstants.loginViewRememberMe)
                            .font(.roboto(.regular, size: 12))
                            .foregroundColor(.getStartedViewTextColor)
                        
                        Spacer()
                    }
                    .onTapGesture {
                        viewModel.isRemembered.toggle()
                    }
                    .padding(.leading, 30)
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 5) {
                        Text(StringConstants.loginViewDontHaveAnAccount)
                            .font(.roboto(.regular, size: 12))
                            .foregroundColor(.getStartedViewTextColor)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text(StringConstants.loginViewSignUpButton)
                                .font(.roboto(.regular, size: 12)).underline()
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.getUser()
                    }, label: {
                        Text(StringConstants.loginViewTitle)
                            .font(.roboto(.regular, size: 15))
                            .foregroundColor(.white)
                    })
                    .padding(.horizontal, 70)
                    .padding(.vertical, 10)
                    .background(viewModel.isValid ? Color.accentColor : Color.disableButtonColor)
                    .cornerRadius(10)
                    .disabled(!viewModel.isValid)
                }
            }
            .navigationDestination(isPresented: $viewModel.isRegistered) {
                HomeView()
            }
        }
        .toolbar(.hidden)
        .alert(DataError.wrongUsernameOrPassword.title, isPresented: $viewModel.isShowError) {
        } message: {
            Text(DataError.wrongUsernameOrPassword.message)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
