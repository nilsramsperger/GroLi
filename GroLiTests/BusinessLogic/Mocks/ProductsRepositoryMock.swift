//
//  ProductsRepositoryMock.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//
import Foundation
@testable import GroLi

struct ProductsRepositoryMock: ProductsRepository {
    func getAll() -> [GroLi.Product] {
        return [Product(id: UUID(), name: "test", rank: 0), Product(id: UUID(), name: "test2", rank: 1), Product(id: UUID(), name: "test3", rank: 2)]
    }
}
