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
        let listProducts: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        let addProduct: AddProductUseCase = AddProductUseCaseImpl(products: products)
        return ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
    }
}
