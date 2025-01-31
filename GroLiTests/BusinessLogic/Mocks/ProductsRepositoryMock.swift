//
//  ProductsRepositoryMock.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//
import Foundation
@testable import GroLi

class ProductsRepositoryMock: ProductsRepository {
    var calls: Int = 0
    
    func getAll() -> [GroLi.Product] {
        self.calls += 1
        return [Product(id: UUID(), name: "test", rank: 0), Product(id: UUID(), name: "test2", rank: 2), Product(id: UUID(), name: "test3", rank: 1)]
    }
}
