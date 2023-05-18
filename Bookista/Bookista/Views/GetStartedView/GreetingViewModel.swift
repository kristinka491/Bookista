//
//  GreetingViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-18.
//

import Foundation
import SwiftUI

class GreetingViewModel: ObservableObject {
    @AppStorage("isUserOnboarded") var isOnboarded = false
}
