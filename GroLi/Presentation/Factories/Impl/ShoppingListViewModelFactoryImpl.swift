//
//  ShoppingListViewModelFactoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Foundation

struct ShoppingListViewModelFactoryImpl: ShoppingListViewModelFactory {
    func create() -> ShoppingListViewModel {
        let dataController = DataController()
        let products: ProductsRepository = ProductsCoreDataRepositoryImpl(context: dataController.container.viewContext)
        let shoppingListUseCases: ShoppingListUseCases = ShoppingListUseCasesImpl(products: products)
        return ShoppingListViewModel(shoppingListUseCases: shoppingListUseCases)
    }
}
