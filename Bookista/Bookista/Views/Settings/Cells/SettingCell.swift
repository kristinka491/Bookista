//
//  ProfileSettingCell.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct SettingCell: View {
    var item: SettingsEnum
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: item.imageName ?? "")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.mainColor)
                
                Text(item.title ?? "")
                    .font(.roboto(.regular, size: 15))
                    .foregroundColor(.getStartedViewTextColor)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.mainColor)
                
            }
            .padding(.all, 5)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            
        }
    }
}

struct ProfileSettingCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingCell(item: .accountInformation)
    }
}
