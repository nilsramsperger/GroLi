//
//  GroLiApp.swift
//  GroLi
//
//  Created by Nils Ramsperger on 09.01.25.
//

import SwiftUI

@main
struct GroLiApp: App {
    let shoppingListViewModelFactory: ShoppingListViewModelFactory
    let shoppingListViewModel: ShoppingListViewModel

    var body: some Scene {
        WindowGroup {
            ShopingListView().environmentObject(shoppingListViewModel)
        }
    }
    
    init() {
        shoppingListViewModelFactory = ShoppingListViewModelFactoryImpl()
        shoppingListViewModel = shoppingListViewModelFactory.create()
        shoppingListViewModel.loadData()
    }
}
