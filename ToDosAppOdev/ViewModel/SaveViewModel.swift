//
//  SaveViewModel.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

@MainActor
class SaveViewModel {
    
    // MARK: - Değişkenler
    private let repository: ToDosRepository
    
    // MARK: - INIT
    init(repository: ToDosRepository) {
        self.repository = repository
    }
    
    // MARK: - SAVE
    func save(name:String) async {
        do{
            try await repository.save(name: name)
        }catch {
            //Hata varsa buraya kod yaz.
        }
    }
}
