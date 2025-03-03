//
//  ShoppingListPreViewModelFactoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Foundation

struct ShoppingListPreViewModelFactoryImpl: ShoppingListViewModelFactory {
    func create() -> ShoppingListViewModel {
        let listProducts = ListProductsUseCaseMock()
        let addProduct = AddProductUseCaseMock()
        let viewModel = ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
        return viewModel
    }
}
