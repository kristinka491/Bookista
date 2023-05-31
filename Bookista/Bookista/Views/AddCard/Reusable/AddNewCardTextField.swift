//
//  AddNewCardTextField.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-29.
//

import SwiftUI

struct AddNewCardTextField: View {
    @Binding var textFieldText: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            HStack() {
                Text(text)
                    .font(.roboto(.regular, size: 13))
                    .foregroundColor(.getStartedViewTextColor)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            TextField("", text: $textFieldText) { UIApplication.shared.endEditing()
            }
            .font(.roboto(.regular, size: 15))
            .frame(height: 40)
            .multilineTextAlignment(.leading)
            .foregroundColor(.getStartedViewTextColor)
            .padding(.leading, 10)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
        }
    }
}

struct AddNewCardTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    static var previews: some View {
        AddNewCardTextField(textFieldText: $field, text: "")
    }
}
