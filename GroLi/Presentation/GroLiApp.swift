//
//  GroLiApp.swift
//  GroLi
//
//  Created by Nils Ramsperger on 09.01.25.
//

import SwiftUI

@main
struct GroLiApp: App {
    let shoppingListViewModel = ShoppingListViewModel(listProducts: ListProductsUseCaseImpl(products: ProductsInMemoryRepositoryImpl()))

    var body: some Scene {
        WindowGroup {
            ShopingListView().environmentObject(shoppingListViewModel)
        }
    }
    
    init() {
        shoppingListViewModel.loadData()
    }
}
