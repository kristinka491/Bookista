//
//  PaymentMethodsView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI

struct PaymentMethodsView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel
    @StateObject var viewModel = PaymentMethodsViewModel()
    
    let colors: [Color] = [.firstCardBackgroundColor, .secondCardBakgroundColor, .thirdCardBackgroundColor, .fourthCardBackgroundColor]

    var body: some View {
        ZStack() {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                TitleView(text: StringConstants.paymentMethodsViewTitle)
                
                ScrollView(showsIndicators: false) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.userCards ?? [], id: \.cardNumber) { item in
                                let suffix = String(item.cardNumber.suffix(4))
                                
                                ZStack {
                                   backgroundColor(for: item)
                                        .frame(width: 350, height: 170)
                                        .cornerRadius(15)
                                    
                                    HStack() {
                                        Spacer()
                                        
                                        Text("**** \(suffix)")
                                            .foregroundColor(.white)
                                            .font(.poppins(.regular, size: 15))
                                    }
                                    .padding(.horizontal, 40)
                                }
                                .padding(.horizontal, 20)
                                .swipeActions {
                                    Button(action: {
                                        viewModel.deleteUserCard(userCard: item)
                                    }) {
                                        Text("Delete")
                                            .foregroundColor(.white)
                                    }
                                    .tint(.red)
                                }
                            }
                        }
                    }
                    
                    NavigationLink(destination: AddCardView()) {
                        ButtonViewText(text: StringConstants.paymentMethodsViewAddButtonTitle)
                    }
                }
            }
        }
        .onAppear {
            tabViewModel.isHiddenTabBar = true
        }
    }
    
    private func backgroundColor(for item: UserCard) -> Color {
        let index = viewModel.userCards?.firstIndex(of: item) ?? 0
        return colors[index % colors.count]
    }
}




struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsView()
            .environmentObject(TabBarViewModel())
    }
}
