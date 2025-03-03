//
//  ShoppingListViewModelFactoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Foundation

struct ShoppingListViewModelFactoryImpl: ShoppingListViewModelFactory {
    func create() -> ShoppingListViewModel {
        let products: ProductsRepository = ProductsInMemoryRepositoryImpl()
        let listProducts: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        let addProduct: AddProductUseCase = AddProductUseCaseImpl(products: products)
        return ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
    }
}
