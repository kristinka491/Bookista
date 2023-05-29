//
//  PasswordTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-24.
//

import SwiftUI

struct SecureTextField: View {
    @Binding var text: String
    
    var body: some View {
        SecureField("", text: $text) {
            UIApplication.shared.endEditing()
        }
        .font(.roboto(.regular, size: 15))
        .frame(height: 40)
        .padding(.leading, 10)
        .multilineTextAlignment(.leading)
        .foregroundColor(.getStartedViewTextColor)
        .autocapitalization(.none)
        .autocorrectionDisabled(true)
    }
}

struct SecureTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        SecureTextField(text: $field)
    }
}
