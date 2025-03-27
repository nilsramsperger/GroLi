//
//  ShoppingListPreViewModelFactoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Foundation

struct ShoppingListPreViewModelFactoryImpl: ShoppingListViewModelFactory {
    func create() -> ShoppingListViewModel {
        let products: ProductsRepository = ProductsInMemoryRepositoryImpl(withProducts: [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)])
        let listProducts: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        let addProduct: AddProductUseCase = AddProductUseCaseImpl(products: products)
        let removeProduct: RemoveProductUseCase = RemoveProductUseCaseImpl(products: products)
        let reorderProducts: ReorderProductsUseCase = ReorderProductsUseCaseImpl(productsRepository: products)
        return ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct, removeProduct: removeProduct, reorderProducts: reorderProducts)
    }
}
