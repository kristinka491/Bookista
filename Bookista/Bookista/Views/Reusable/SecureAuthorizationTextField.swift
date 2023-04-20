//
//  SecureAuthorizationTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-19.
//

import SwiftUI

struct SecureAuthorizationTextField: View {
    var placeHolder: String
    var imageName: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: imageName)
                .foregroundColor(.accentColor)
                .padding(.leading, 10)
            
            SecureField(placeHolder, text: $text)
                .font(.roboto(.regular, size: 15))
                .frame(height: 40)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .autocapitalization(.none)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding([.trailing, .leading], 20)
        .padding(.bottom, 20)
    }
}

struct SecureAuthorizationTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        SecureAuthorizationTextField(placeHolder: "Test", imageName: "Test", text: $field)
    }
}
