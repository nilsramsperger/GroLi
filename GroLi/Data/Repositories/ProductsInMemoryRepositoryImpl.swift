//
//  ProductsInMemoryRepositoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ProductsInMemoryRepositoryImpl: ProductsRepository {
    var procucts: [Product] = []
    
    init() {
        self.procucts = [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
    }
    
    func getAll() -> [Product] {
        return self.procucts
    }
    
    func add(_ product: Product) {
        self.procucts.append(product)
    }
}
