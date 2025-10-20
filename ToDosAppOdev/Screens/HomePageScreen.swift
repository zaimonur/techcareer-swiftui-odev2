//
//  HomePage.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import SwiftUI

struct HomePageScreen: View {
    
    // MARK: - INIT
    init () {
        NavigationBarStyle.setupNavigationBar()
        DatabaseHelper.copyDatabase()
        SearchBarStyle.setupSearchBar()
    }
    
    // MARK: - Variables
    @State private var searchText = ""
    @ObservedObject var viewModel = HomePageViewModel(repository: ToDosRepository())
    
    // MARK: - ComputedViews
    private var homePageContent: some View {
        Group{
            if viewModel.toDosList.isEmpty{
                Text(Constant.toDosEmpty)
                    .foregroundStyle(.black) //Modifier
            }
            else{
                List{
                    ForEach(viewModel.toDosList){ toDo in
                        NavigationLink(destination: UpdateScreen(toDo: toDo)){
                            ToDoListItem(toDo: toDo)
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            
        }
        .navigationTitle(Constant.navigationTitleText)
        .onAppear(){
            Task{
                await viewModel.loadToDos()
            }
        }
    }
    
    // MARK: - Functions
    func delete(at offset: IndexSet){
        let toDo = viewModel.toDosList[offset.first!]
        Task{
            await viewModel.delete(id: toDo.id!)
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
            homePageContent
        }
        .tint(.white)
        .searchable(text: $searchText,prompt: Constant.ara)
        .onChange(of: searchText) { _,result in
            Task{
                await viewModel.search(text: searchText)
            }
        }
    }
}

// MARK: - Constants
extension HomePageScreen {
    enum Constant {
        static let navigationTitleText = "Yapılacaklar Listesi"
        static let toDosEmpty = "Görev Yok!"
        static let ara = "Görev Ara..."
    }
    
}

// MARK: - SearchBar Appearance
enum SearchBarStyle {
    static func setupSearchBar() {
        let textFieldAppearance = UISearchTextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        textFieldAppearance.backgroundColor = .white
        textFieldAppearance.textColor = .black
        textFieldAppearance.tintColor = .black
    }
}

// MARK: - Preview
#Preview {
    HomePageScreen()
}


