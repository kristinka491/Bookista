//
//  SignUpView.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-17.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack() {
                Image("LoginAndSignUpBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text(StringConstants.signUpViewTitle)
                        .font(.roboto(.regular, size: 30))
                        .foregroundColor(.mainColor)
                        .padding(.bottom, 40)
                    
                    AuthorizationTextField(placeHolder: StringConstants.signUpViewNameTitle, imageName: "person", text: $viewModel.name)
                    
                    
                    AuthorizationTextField(placeHolder: StringConstants.signUpViewEmailTitle, imageName: "envelope", text: $viewModel.email)
                    if !viewModel.isEmailValid {
                        HStack(spacing: 0) {
                            Text(StringConstants.signUpViewInvalidEmail)
                                .font(.roboto(.regular, size: 10))
                                .foregroundColor(.mainColor)
                                .padding(.horizontal, 30)
                                .padding(.top, -20)
                            Spacer()
                        }
                    }
                    
                    AuthorizationTextField(placeHolder: StringConstants.loginViewPasswordTitle, imageName: "lock", text: $viewModel.password)
                    
                    HStack(spacing: 5) {
                        Text(StringConstants.sighUpViewAlreadyHaveAnAccount)
                            .font(.roboto(.regular, size: 12))
                            .foregroundColor(.getStartedViewTextColor)
                        
                        NavigationLink(destination: LoginView()) {
                            Text(StringConstants.signUpViewLoginButton)
                                .font(.roboto(.regular, size: 12)).underline()
                                .foregroundColor(.mainColor)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.saveUser()
                    }, label: {
                        Text(StringConstants.signUpViewCreateAnAccountButton)
                            .font(.roboto(.regular, size: 15))
                            .foregroundColor(.white)
                    })
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(viewModel.isValid ? Color.mainColor : Color.disableButtonColor)
                    .cornerRadius(10)
                    .disabled(!viewModel.isValid)
                }
            }
        }
        .toolbar(.hidden)
        .alert(DataError.userIsRegistered.title, isPresented: $viewModel.isShowError) {
        } message: {
            Text(DataError.userIsRegistered.message)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
