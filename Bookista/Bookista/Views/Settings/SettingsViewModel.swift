//
//  ProfileViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-15.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("isUserLogged") var isLogged = true
    
    var profileSettings = SettingsEnum.allCases
}
