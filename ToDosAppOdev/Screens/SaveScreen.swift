//
//  SaveScreen.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import SwiftUI

struct SaveScreen: View { //Start SaveScreen
    
    // MARK: - Variables
    @State private var nameController = ""
    @State private var showError = false
    @State private var showSuccess = false
    
    // MARK: - viewModel
    var viewModel = SaveViewModel(repository: ToDosRepository())
    
    // MARK: - Computed Views
    private var button : some View {
        Button{
            if nameController.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                showError = true
                showSuccess = false
            }else {
                showError = false
                showSuccess = true
                Task{
                    await viewModel.save(name: nameController)
                    nameController = ""
                    showSuccess = true
                }
            }
        }
        label: {
            Text(Constant.saveText)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(CustomButtonStyle())
    }
    private var saveContent : some View {
        VStack(spacing : 32){
            TextField(Constant.textFieldPlaceHolderText,text: $nameController)
                .textFieldStyle(CustomTextfieldStyle())
            if showError{
                Text(Constant.errorText)
                    .foregroundStyle(.red)
            }else if showSuccess{
                Text(Constant.successSaveText)
                    .foregroundStyle(.green)
            }
            button
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .navigationTitle(Constant.saveText)
        .navigationBarBackButtonHidden(true)
    }
    
    var body: some View {
        saveContent
    }
}

// MARK: - Constants
extension SaveScreen {
    enum Constant{
        static let saveText = "Save"
        static let successSaveText = "Saved Successfully!"
        static let errorText = "Name can not be emtpy!"
        static let textFieldPlaceHolderText = "Görev giriniz..."
    }
}

#Preview {
    SaveScreen()
}
