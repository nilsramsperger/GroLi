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
    
    @Published var products: [Product] = []
    
    init(listProducts: ListProductsUseCase, addProduct: AddProductUseCase, removeProduct: RemoveProductUseCase) {
        listProductsUseCase = listProducts
        addProductUseCase = addProduct
        removeProductUseCase = removeProduct
    }
    
    func loadItems() {
        products = listProductsUseCase.listProducts()
    }
    
    func addItem(name: String) {
        addProductUseCase.addProduct(name: name)
        loadItems()
    }
    
    func deleteItems(at indexSet: IndexSet) {
        for index in indexSet {
            if let idToDelete = products.indices.contains(index) ? products[index].id : nil {
                removeProductUseCase.removeProduct(withId: idToDelete)
                products = products.filter { $0.id != idToDelete}
            }
        }
        loadItems()
    }
}
