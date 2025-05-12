//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation
import Combine

class ShoppingListViewModel: ObservableObject {
    let shoppingListUseCases: ShoppingListUseCases
    
    @Published var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(shoppingListUseCases: ShoppingListUseCases) {
        self.shoppingListUseCases = shoppingListUseCases
        $products
            .sink(receiveValue: { [weak self] newValue in
                guard let self = self else { return }
                for newProduct in newValue {
                    if let existingProduct = self.products.first(where: { $0.id == newProduct.id }),
                       existingProduct.checked != newProduct.checked {
                        self.shoppingListUseCases.toggleProductChecked(of: newProduct.id)
                    }
                }
            })
            .store(in: &cancellables)
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
