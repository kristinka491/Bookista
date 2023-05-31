//
//  TitleView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-29.
//

import SwiftUI

struct TitleView: View {
    var text: String = ""
    var body: some View {
        Text(text)
            .foregroundColor(.mainColor)
            .font(.poppins(.regular, size: 30))
            .padding(.top, 30)
            .padding(.bottom, 30)
            .padding(.horizontal, 20)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(text: "")
    }
}
