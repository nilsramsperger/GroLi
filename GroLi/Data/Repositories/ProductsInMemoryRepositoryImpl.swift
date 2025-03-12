//
//  ProductsInMemoryRepositoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ProductsInMemoryRepositoryImpl: ProductsRepository {
    var products: [Product] = []
    
    init(withProducts products: [Product]) {
        self.products = products
    }
    
    func getAll() -> [Product] {
        return products
    }
    
    func get(byId id: UUID) -> Product? {
        return products.first(where: { $0.id == id })
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
