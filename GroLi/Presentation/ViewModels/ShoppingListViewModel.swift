//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    let listProductsUseCase: ListProductsUseCase
    let addProductUseCase: AddProductUseCase
    let removeProductUseCase: RemoveProductUseCase
    let reorderProductsUseCase: ReorderProductsUseCase
    
    @Published var products: [Product] = []
    
    init(listProducts: ListProductsUseCase, addProduct: AddProductUseCase, removeProduct: RemoveProductUseCase, reorderProducts: ReorderProductsUseCase) {
        listProductsUseCase = listProducts
        addProductUseCase = addProduct
        removeProductUseCase = removeProduct
        reorderProductsUseCase = reorderProducts
    }
    
    func loadItems() {
        products = listProductsUseCase.listProducts()
    }
    
    func addItem(name: String) {
        addProductUseCase.addProduct(name: name)
        loadItems()
    }
    
    func deleteItem(at index: Int) {
        if let idToDelete = products.indices.contains(index) ? products[index].id : nil {
            removeProductUseCase.removeProduct(withId: idToDelete)
        }
        loadItems()
    }
    
    func reorderItems() {
        reorderProductsUseCase.reorderProducts(byIds: products.map { $0.id })
        loadItems()
    }
}
