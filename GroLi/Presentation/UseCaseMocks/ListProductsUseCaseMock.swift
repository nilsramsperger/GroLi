//
//  ListProductsUseCaseMock.swift
//  GroLi
//
//  Created by Nils Ramsperger on 20.02.25.
//

import Foundation

struct ListProductsUseCaseMock: ListProductsUseCase {
    func listProducts() -> [Product] {
        return [Product(id: UUID(), name: "Bread", rank: 0, checked: false), Product(id: UUID(), name: "Butter", rank: 1, checked: true), Product(id: UUID(), name: "Jam", rank: 2, checked: false)]
    }
}
