//
//  UptadeScreen.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import SwiftUI

struct UpdateScreen: View {
    
    // MARK: - Dismiss
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Variables
    var toDo: ToDos
    @State private var nameController = ""
    @State private var showError = false
    var viewModel = UpdateViewModel(repository: ToDosRepository())
    
    // MARK: - Computed Views
    private var backButton: some View {
        Button{
            dismiss()
        }
        label: {
            Text(Constant.backButtonText)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(CustomButtonStyle())
    }
    private var saveButton: some View {
        Button{
            if nameController.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                showError = true
            }else {
                showError = false
                if let id = toDo.id{
                    Task{
                        await viewModel.update(id: id, name: nameController)
                    }
                }
                dismiss()
            }
        }
        label: {
            Text(Constant.saveButtonText)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(CustomButtonStyle())
    }
    private var updateScreenContent: some View {
        VStack(spacing : 32){
            TextField(Constant.updateTextField,text: $nameController)
                .textFieldStyle(CustomTextfieldStyle())
            if showError{
                Text(Constant.updateErrorText).foregroundStyle(.red)
            }
            saveButton
            backButton
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .padding()
        .navigationTitle(Constant.navigationTitleText)
        .navigationBarBackButtonHidden(true)
        .onAppear{
            if let name = toDo.name{
                nameController = name
            }
        }
    }

    // MARK: - Body
    var body: some View {
        updateScreenContent
    }
}

// MARK: - Constants
extension UpdateScreen{
    enum Constant {
        static let backButtonText = "Geri Dön"
        static let saveButtonText = "Kaydet"
        static let updateErrorText = "Name can not be emtpy!"
        static let updateTextField = "Değişikliği giriniz..."
        static let navigationTitleText = "Güncelleme Ekranı"
    }
}

