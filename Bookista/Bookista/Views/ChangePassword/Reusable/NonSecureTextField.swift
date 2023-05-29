//
//  TextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-24.
//

import SwiftUI

struct NonSecureTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text) {
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

struct NonSecureTextField_Preview: PreviewProvider {
    @State static var field: String = "Test"

    static var previews: some View {
        NonSecureTextField(text: $field)
    }
}
