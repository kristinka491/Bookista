//
//  TogglePasswordTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-19.
//

import SwiftUI

struct TogglePasswordTextField: View {
    @State private var isSecure = true
    @Binding var password: String
    
    var body: some View {
        HStack(spacing: 0) {
            if isSecure == true {
                SecureAuthorizationTextField(placeHolder: StringConstants.signUpViewPasswordTitle, imageName: "lock", text: $password)
            } else {
                AuthorizationTextField(placeHolder: StringConstants.signUpViewPasswordTitle, imageName: "lock", text: $password)
                    .padding(.leading, 30)
                    .padding(.bottom, -20)
            }
                
            Image(systemName: isSecure ? "eye" : "eye.slash")
                .foregroundColor(.black)
                .padding(.trailing, 10)
                .onTapGesture {
                    isSecure.toggle()
                }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding([.trailing, .leading, .bottom], 20)
    }
}

struct TogglePasswordTextField_Previews: PreviewProvider {
    @State static var password: String = "password"
    
    static var previews: some View {
        TogglePasswordTextField(password: $password)
    }
}

