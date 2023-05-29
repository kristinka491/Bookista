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
    @State var isSavedWithoutChanges = false

    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 7) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 10, height: 18)
                        .foregroundColor(.mainColor)
                    
                    Text(StringConstants.accountInformationBackButton)
                        .foregroundColor(.mainColor)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                .onTapGesture {
                    if !viewModel.isChanged {
                        dismiss()
                    } else {
                        isSavedWithoutChanges = true
                    }
                }
                .confirmationDialog(StringConstants.saveWithoutChangesTitle, isPresented: $isSavedWithoutChanges, titleVisibility: .visible) {
                    Button(StringConstants.accountInformationCancelButton, role: .cancel) {
                        isSavedWithoutChanges = false
                    }
                    .background(Color.getStartedViewTextColor)
                    
                    Button(StringConstants.accountInformationYesButton, role: .none) {
                        isSavedWithoutChanges = false
                        dismiss()
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    Text(StringConstants.accountInformationViewTitle)
                        .foregroundColor(.mainColor)
                        .font(.poppins(.regular, size: 30))
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 20)
                    
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .configureImage()
                    } else {
                        Image(systemName: "person.crop.circle")
                            .configureImage()
                            .foregroundColor(.mainColor)
                    }
                    
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        Text(StringConstants.accountInformationViewChangePhoto)
                            .foregroundColor(.getStartedViewTextColor)
                            .font(.poppins(.regular, size: 12))
                    }
                    .onChange(of: viewModel.selectedItem) { newValue in
                        Task {
                            if let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                viewModel.selectedImage = image
                                viewModel.isImageSet = true
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    AuthorizationTextField(placeHolder: StringConstants.accountInformationViewFirstName,
                                           imageName: "person", text: $viewModel.firstName)
                    
                    AuthorizationTextField(placeHolder: StringConstants.accountInformationViewLastName, imageName: "person", text: $viewModel.lastName)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "envelope")
                            .foregroundColor(.mainColor)
                            .padding(.leading, 10)
                        
                        Text(viewModel.email)
                            .font(.roboto(.regular, size: 15))
                            .frame(height: 40)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.getStartedViewTextColor)
                        
                        Spacer()
                    }
                    .background(Color.disabledTextFieldColor)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    Button(action: {
                        viewModel.updateProfile()
                        dismiss()
                    }, label: {
                        Text(StringConstants.accountInformationViewSaveChangesButtonTitle)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .font(.poppins(.regular, size: 15))
                            .padding(.vertical, 13)
                            .background(viewModel.isChanged ? Color.mainColor : Color.disabledButtonColor)
                            .cornerRadius(10)
                            .padding(.all, 20)
                    })
                    .disabled(!viewModel.isChanged)
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        Text(StringConstants.accountInformationViewChangePassword)
                            .foregroundColor(.mainColor)
                            .font(.poppins(.regular, size: 15))
                    }
                    .padding(.bottom, 10)
                    
                    Text(StringConstants.accountInformationViewDeleteAccountText)
                        .font(.poppins(.regular, size: 15))
                        .foregroundColor(.getStartedViewTextColor)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.deleteUser(email: viewModel.email)
                    }, label: {
                        Text(StringConstants.accountInformationViewDeleteButtonTitle)
                            .foregroundColor(.mainColor)
                            .font(.poppins(.regular, size: 15))
                            .padding(.all, 15)
                        
                    })
                }
            }
        }
        .toolbar(.hidden)
        .onAppear {
            tabViewModel.isHiddenTabBar = true
        }
    }
}

fileprivate extension Image {
    
    func configureImage() -> some View {
        return self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .padding(.bottom, 10)
    }
}

struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
            .environmentObject(TabBarViewModel())
    }
}



