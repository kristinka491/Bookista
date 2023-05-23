//
//  AccountInformationView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-16.
//

import SwiftUI
import PhotosUI

struct AccountInformationView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AccountInformationViewModel()

    var body: some View {
        ZStack() {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    HStack(spacing: 0) {
                        Text(StringConstants.accountInformationViewTitle)
                            .foregroundColor(.mainColor)
                            .font(.poppins(.regular, size: 30))
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 20)
                    
                    Image(uiImage: ((viewModel.selectedImage ?? UIImage(systemName: "person.crop.circle")) ?? UIImage()))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .blendMode(.overlay)
                        .padding(.bottom, 10)
                    
                    
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        Text(StringConstants.accountInformationViewChangePhoto)
                            .foregroundColor(.getStartedViewTextColor)
                            .font(.poppins(.regular, size: 12))
                    }
                    .onChange(of: viewModel.selectedItem) { newValue in
                        Task {
                            if let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                viewModel.selectedImage = image
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    AuthorizationTextField(placeHolder: StringConstants.accountInformationViewFirstName,
                                           imageName: "person", text: $viewModel.firstName)
                    
                    AuthorizationTextField(placeHolder: StringConstants.accountInformationViewLastName, imageName: "signature", text: $viewModel.lastName)
                    
                    AuthorizationTextField(placeHolder: StringConstants.accountInformationViewEmail, imageName: "envelope", text: $viewModel.email)
                    
                    HStack(spacing: 5) {
                        Image(systemName: "lock")
                            .foregroundColor(.mainColor)
                            .padding(.leading, 10)
                        
                        NavigationLink(destination: LoginView()) {
                            Text(StringConstants.accountInformationViewChangePassword)
                                .foregroundColor(.secondary).opacity(0.5)
                                .font(.poppins(.regular, size: 15))
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    
                    Text(StringConstants.accountInformationViewSaveChangesButtonTitle)
                        .foregroundColor(.getStartedViewTextColor)
                        .font(.poppins(.regular, size: 15))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding([.horizontal, .bottom], 20)
                        .onTapGesture {
                            viewModel.updateProfile()
                            dismiss()
                        }
                    
                    Text(StringConstants.accountInformationViewDeleteAccountText)
                        .font(.poppins(.regular, size: 15))
                        .foregroundColor(.getStartedViewTextColor)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.deleteUser(email: viewModel.email)
                    }, label: {
                        Text(StringConstants.accountInformationViewDeleteButtonTitle)
                            .lineLimit(0)
                            .foregroundColor(.white)
                            .font(.poppins(.regular, size: 15))
                            .padding(.all, 15)
                        
                    })
                    .padding(.horizontal, 20)
                    .background(Color.mainColor)
                    .cornerRadius(10)
                    .padding(.bottom, 100)
                }
            }
            .onAppear {
                tabViewModel.isHiddenTabBar = true
            }
            .onWillDisappear {
                tabViewModel.isHiddenTabBar = false
            }
            .onDisappear {
                
            }
        }
    }
}

struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
            .environmentObject(TabBarViewModel())
    }
}



