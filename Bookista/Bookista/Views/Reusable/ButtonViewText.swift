//
//  ButtonView.swift
//  Bookista
//
//  Created by Krystsina on 2023-06-06.
//

import SwiftUI

struct ButtonViewText: View {
    var text: String
    var isDisabled: Bool = true
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(.poppins(.regular, size: 15))
            .padding(.vertical, 13)
            .background(isDisabled ?
                Color.mainColor: Color.disabledButtonColor)
            .cornerRadius(10)
            .padding(.all, 20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViewText(text: "", isDisabled: true)
    }
}
