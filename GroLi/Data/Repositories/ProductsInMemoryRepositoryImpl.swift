//
//  ProductsInMemoryRepositoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ProductsInMemoryRepositoryImpl: ProductsRepository {
    var products: [Product] = []
    
    init() {
        products = [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
    }
    
    func getAll() -> [Product] {
        return products
    }
    
    func add(_ product: Product) {
        products.append(product)
    }
    
    func remove(_ product: Product) {
        products = products.filter { $0.id != product.id }
    }
    
    func update(_ product: Product) {
        remove(product)
        add(product)
    }
}
