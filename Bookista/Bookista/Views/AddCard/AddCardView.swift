//
//  AddCardView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-29.
//

import SwiftUI
import Combine

struct AddCardView: View {
    @StateObject var viewModel = AddCardViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                TitleView(text: StringConstants.addCardViewTitle)
                
                Image("CardsImage")
                    .resizable()
                    .frame(width: 250, height: 200)
                    .padding(.bottom, 20)
                
                ScrollView(showsIndicators: false) {
                    AddNewCardTextField(textFieldText: $viewModel.cardNumber, text: StringConstants.addCardViewCardNumber)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.cardNumber) { newValue in
                            let formattedText = formatText(newValue)
                            viewModel.cardNumber = formattedText
                        }
                        .onReceive(Just(viewModel.cardNumber)) { newValue in
                            if newValue.count > 20 {
                                viewModel.cardNumber = String(newValue.prefix(20))
                            }
                        }
                    
                    
                    AddNewCardTextField(textFieldText: $viewModel.nameOnCard, text: StringConstants.addCardViewName)
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled()
                    
                    HStack {
                        AddNewCardTextField(textFieldText: $viewModel.expirationDate, text: StringConstants.addCardViewExpirationDate)
                            .keyboardType(.numberPad)
                            .onChange(of: viewModel.expirationDate) { newValue in
                                if newValue.count <= 4 {
                                    let formattedValue = newValue.prefix(5).replacingOccurrences(of: "/", with: "")
                                    if formattedValue.count >= 3 {
                                        let index = formattedValue.index(formattedValue.startIndex, offsetBy: 2)
                                        let prefix = formattedValue[..<index]
                                        let suffix = formattedValue[index...]
                                        viewModel.expirationDate = "\(prefix)/\(suffix)"
                                    } else {
                                        viewModel.expirationDate = formattedValue
                                    }
                                }
                            }
                            .onReceive(Just(viewModel.expirationDate)) { newValue in
                                if newValue.count > 5 {
                                    viewModel.expirationDate = String(newValue.prefix(5))
                                }
                            }
                            
                       
                        AddNewCardTextField(textFieldText: $viewModel.CVV, text: StringConstants.addCardViewCVV)
                            .keyboardType(.numberPad)
                            .onReceive(Just(viewModel.CVV)) { newValue in
                                if newValue.count > 3 {
                                    viewModel.CVV = String(newValue.prefix(3))
                                }
                            }
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Text(StringConstants.accountInformationViewSaveChangesButtonTitle)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .font(.poppins(.regular, size: 15))
                            .padding(.vertical, 13)
                            .background(viewModel.isNotEmpty ?
                                Color.mainColor: Color.disabledButtonColor)
                            .cornerRadius(10)
                            .padding(.all, 20)
                    })
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
    
    private func formatText(_ text: String) -> String {
            let trimmedText = text.replacingOccurrences(of: " ", with: "")
            let chunkSize = 4
            var formattedText = ""

            for index in stride(from: 0, to: trimmedText.count, by: chunkSize) {
                let startIndex = trimmedText.index(trimmedText.startIndex, offsetBy: index)
                let endIndex = trimmedText.index(startIndex, offsetBy: min(chunkSize, trimmedText.count - index))
                let chunk = trimmedText[startIndex..<endIndex]
                formattedText += "\(chunk) "
            }

            if formattedText.last == " " {
                formattedText.removeLast()
            }

            return formattedText
        }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}
