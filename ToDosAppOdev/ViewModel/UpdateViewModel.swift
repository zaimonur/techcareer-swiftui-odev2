//
//  UpdateViewModel.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

@MainActor
class UpdateViewModel {
    
    // MARK: - Değişkenler
    private let repository: ToDosRepository
    
    // MARK: - INIT
    init(repository: ToDosRepository) {
        self.repository = repository
    }
    
    // MARK: - SAVE
    func update(id:Int,name:String) async {
        do{
            try await repository.update(id: id, name: name)
        }catch {
            //CATCH
        }
    }
}
