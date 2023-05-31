//
//  AddCardViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-29.
//

import Foundation
import Combine

class AddCardViewModel: ObservableObject {
    @Published var cardNumber: String = ""
    @Published var nameOnCard: String = ""
    @Published var CVV: String = ""
    @Published var expirationDate: String = ""
    @Published var isNotEmpty = false
    
    private var publishers = Set<AnyCancellable>()

    init() {
        isTextFieldsAreNotEmpty()
    }
    
    private func isTextFieldsAreNotEmpty() {
        Publishers.CombineLatest4($cardNumber, $nameOnCard, $CVV, $expirationDate).map { cardNumber, nameOnCard, CVV, expirationDate in
            return !cardNumber.isEmpty && !nameOnCard.isEmpty && !CVV.isEmpty && !expirationDate.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isNotEmpty, on: self)
        .store(in: &publishers)
    }
}
