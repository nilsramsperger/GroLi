//
//  GroLiApp.swift
//  GroLi
//
//  Created by Nils Ramsperger on 09.01.25.
//

import SwiftUI

@main
struct GroLiApp: App {
    let globalViewModel: GlobalViewModel
    let shoppingListViewModelFactory: ShoppingListViewModelFactory
    let shoppingListViewModel: ShoppingListViewModel

    var body: some Scene {
        WindowGroup {
            NavigationManagerView()
                .environmentObject(shoppingListViewModel)
                .environmentObject(globalViewModel)
        }
    }
    
    init() {
        globalViewModel = GlobalViewModel()
        shoppingListViewModelFactory = ShoppingListViewModelFactoryImpl()
        shoppingListViewModel = shoppingListViewModelFactory.create(globalViewModel: globalViewModel)
        shoppingListViewModel.loadItems()
    }
}
