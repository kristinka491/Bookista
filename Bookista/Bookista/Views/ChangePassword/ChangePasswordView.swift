//
//  ChangePasswordView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-24.
//

import SwiftUI

struct ChangePasswordView: View {
    @StateObject var viewModel = ChangePasswordViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack() {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(StringConstants.changePasswordViewTitle)
                        .foregroundColor(.mainColor)
                        .font(.poppins(.regular, size: 30))
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 50)
                
                HStack() {
                    Text(StringConstants.changePasswordViewSubtitle)
                        .foregroundColor(.getStartedViewTextColor)
                        .font(.poppins(.regular, size: 15))
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                VStack(spacing: -15) {
                    HStack(spacing: 0) {
                        Text(StringConstants.changePasswordViewPassword)
                            .foregroundColor(.mainColor)
                            .font(.poppins(.regular, size: 15))
                        
                        Spacer()
                    }
                    .padding([.horizontal, .bottom], 20)
                    
                    PasswordTextField(password: $viewModel.password)
                }
                
                VStack(spacing: -15) {
                    HStack(spacing: 0) {
                        Text(StringConstants.changePasswordViewConfirmPassword)
                            .foregroundColor(.mainColor)
                            .font(.poppins(.regular, size: 15))
                        
                        Spacer()
                    }
                    .padding([.horizontal, .bottom], 20)
                    
                    PasswordTextField(password: $viewModel.confirmPassword)
                }
                
                Button(action: {
                    if viewModel.isChangedPassword {
                        dismiss()
                    }
                }, label: {
                    Text(StringConstants.accountInformationViewSaveChangesButtonTitle)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.poppins(.regular, size: 15))
                        .padding(.vertical, 13)
                        .background(viewModel.isConfirmed ? Color.mainColor : Color.disabledButtonColor)
                        .cornerRadius(10)
                        .padding(.all, 20)
                })
                .disabled(!viewModel.isConfirmed)
                .alert(DataError.theSamepassword.title, isPresented: $viewModel.isShowTheSamePasswordError) {
                } message: {
                    Text(DataError.theSamepassword.message)
                }
                
                Spacer()
            }
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
