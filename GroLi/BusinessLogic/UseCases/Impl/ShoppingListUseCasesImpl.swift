//
//  ShoppingListUseCasesImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Foundation

struct ShoppingListUseCasesImpl: ShoppingListUseCases {
    var products: ProductsRepository
    
    func listProducts() -> [Product] {
        return products.getAll().sorted { $0.rank < $1.rank }
    }
    
    func addProduct(name: String) {
        let maxRank = products.getAll().max(by: { $0.rank < $1.rank })?.rank ?? 0
        let newProduct = Product(id: UUID(), name: name, rank: maxRank + 1, checked: false)
        products.add(newProduct)
    }
    
    func removeProduct(withId id: UUID) {
        if let product = products.get(byId: id) {
            products.remove(product)
            products.getAll()
                .sorted { $0.rank < $1.rank }
                .enumerated()
                .map { Product(id: $1.id, name: $1.name, rank: $0, checked: $1.checked) }
                .forEach { products.update($0) }
        }
    }
    
    func reorderProducts(byIds ids: [UUID]) {
        var index = 0
        ids.forEach { id in
            if let product = products.get(byId: id) {
                products.update(Product(id: product.id, name: product.name, rank: index, checked: product.checked))
                index += 1
            }
        }
    }
    
    func toggleProductChecked(of id: UUID) {
        if let product = products.get(byId: id) {
            products.update(Product(id: product.id, name: product.name, rank: product.rank, checked: !product.checked))
        }
    }
}
