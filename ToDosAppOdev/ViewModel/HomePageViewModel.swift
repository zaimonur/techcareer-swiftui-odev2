//
//  HomePageViewModel.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

@MainActor
class HomePageViewModel: ObservableObject {
    
    // MARK: - Değişkenler
    private let repository: ToDosRepository
    @Published var toDosList = [ToDos]()
    
    init(repository: ToDosRepository) {
        self.repository = repository
    }
    
    // MARK: - LOAD
    func loadToDos() async {
        do{
            toDosList = try await repository.loadToDos()
        }catch {
            toDosList = [ToDos]()
        }
    }
    
    // MARK: - SEARCH
    func search(text: String) async {
        do{
            toDosList = try await repository.search(searchText: text)
        }catch {
            toDosList = [ToDos]()
        }
    }
    
    // MARK: - DELETE
    func delete(id:Int) async {
        do {
            try await repository.delete(id: id)
            await loadToDos()
        }catch {
            //CATCH
        }
    }
}
