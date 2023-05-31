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
                        .foregroundColor(.mainColor)
                        .padding(.bottom, 40)
                    
                    AuthorizationTextField(placeHolder: StringConstants.loginViewEmailTitle, imageName: "envelope", text: $viewModel.email)
                    AuthorizationTextField(placeHolder: StringConstants.loginViewPasswordTitle, imageName: "lock", text: $viewModel.password) 
                        .padding(.bottom, -10)
                    
                    HStack(spacing: 5) {
                        Text(StringConstants.loginViewDontHaveAnAccount)
                            .font(.roboto(.regular, size: 12))
                            .foregroundColor(.getStartedViewTextColor)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text(StringConstants.loginViewSignUpButton)
                                .font(.roboto(.regular, size: 12)).underline()
                                .foregroundColor(.mainColor)
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
                    .background(viewModel.isValid ? Color.mainColor : Color.disabledButtonColor)
                    .cornerRadius(10)
                    .disabled(!viewModel.isValid)
                }
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
