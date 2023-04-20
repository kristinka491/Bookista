//
//  AuthorizationTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-04-19.
//

import SwiftUI

struct AuthorizationTextField: View {
    var placeHolder: String
    var imageName: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .foregroundColor(.accentColor)
                .padding(.leading, 10)
            
            TextField(placeHolder, text: $text, prompt: Text(placeHolder).foregroundColor(Color.getStartedViewTextColor))
                .font(.roboto(.regular, size: 15))
                .frame(height: 40)
                .multilineTextAlignment(.leading)
                .foregroundColor(.getStartedViewTextColor)
                
                .autocapitalization(.none)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding([.trailing, .leading], 20)
        .padding(.bottom, 20)
    }
}

struct AuthorizationTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        AuthorizationTextField(placeHolder: "Test", imageName: "Test", text: $field)
    }
}
