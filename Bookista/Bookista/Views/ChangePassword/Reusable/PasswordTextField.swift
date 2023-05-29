//
//  PasswordTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-24.
//

import SwiftUI

struct PasswordTextField: View {
    @State private var isSecure = true
    @Binding var password: String
    
    var body: some View {
            HStack(spacing: 0) {
                if isSecure == true {
                    SecureTextField(text: $password)
                } else {
                    NonSecureTextField(text: $password)
                }
                
                Image(systemName: isSecure ? "eye" : "eye.slash")
                    .foregroundColor(.mainColor)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        isSecure.toggle()
                    }
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    @State static var password: String = "password"
    
    static var previews: some View {
        PasswordTextField(password: $password)
    }
}
