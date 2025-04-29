//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    let shoppingListUseCases: ShoppingListUseCases
    
    @Published var products: [Product] = []
    
    init(shoppingListUseCases: ShoppingListUseCases) {
        self.shoppingListUseCases = shoppingListUseCases
    }
    
    func loadItems() {
        products = shoppingListUseCases.listProducts()
    }
    
    func addItem(name: String) {
        shoppingListUseCases.addProduct(name: name)
        loadItems()
    }
    
    func deleteItem(at index: Int) {
        if let idToDelete = products.indices.contains(index) ? products[index].id : nil {
            shoppingListUseCases.removeProduct(withId: idToDelete)
        }
        loadItems()
    }
    
    func reorderItems() {
        shoppingListUseCases.reorderProducts(byIds: products.map { $0.id })
        loadItems()
    }
}
