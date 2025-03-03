//
//  ProductsRepositoryMock.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//
import Foundation
@testable import GroLi

class ProductsRepositoryMock: ProductsRepository {
    
    var getAllCalls: Int = 0
    var addCalls: Int = 0
    var lastAddedProduct: GroLi.Product?
    
    func getAll() -> [GroLi.Product] {
        self.getAllCalls += 1
        return [Product(id: UUID(), name: "test", rank: 0, checked: false), Product(id: UUID(), name: "test2", rank: 2, checked: true), Product(id: UUID(), name: "test3", rank: 1, checked: false)]
    }
    
    func add(_ product: GroLi.Product) {
        self.addCalls += 1
        self.lastAddedProduct = product
    }
}
