//
//  ShoppingListViewModelFactoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Foundation

struct ShoppingListViewModelFactoryImpl: ShoppingListViewModelFactory {
    func create() -> ShoppingListViewModel {
        let products: ProductsRepository = ProductsInMemoryRepositoryImpl(withProducts: [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)])
        let shoppingListUseCases: ShoppingListUseCases = ShoppingListUseCasesImpl(products: products)
        return ShoppingListViewModel(shoppingListUseCases: shoppingListUseCases)
    }
}
