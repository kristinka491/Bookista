//
//  PaymentMethodsViewModel.swift
//  Bookista
//
//  Created by Krystsina on 2023-06-01.
//

import Foundation
import RealmSwift

class PaymentMethodsViewModel: ObservableObject {
    @Published var user: User?
    @Published var userCards: [UserCard]?
    
    private let realmDataStore = RealmDataStore.shared
    private var notificationToken: NotificationToken?
    
    init() {
        loadUserCards()
        observeUserChanges()
    }
    
    func deleteUserCard(userCard: UserCard) {
        realmDataStore.deleteUserCard(with: userCard.cardNumber)
    }
    
    private func loadUserCards() {
        user = realmDataStore.getCurrentUser()
        userCards = user?.cards.toArray()
    }
    
    private func observeUserChanges() {
        notificationToken = user?.observe { [weak self] change in
            guard let self = self else { return }
            
            switch change {
            case .change(let object, let properties):
                if let user = object as? User, properties.contains(where: { $0.name == "cards" }) {
                    self.userCards = user.cards.toArray()
                }
            case .error(let error):
                print("Error observing user: \(error)")
            case .deleted:
                break
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}


