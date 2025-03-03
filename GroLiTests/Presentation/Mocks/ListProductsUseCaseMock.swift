//
//  ListProductsUseCaseMock.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Foundation
@testable import GroLi

class ListProductsUseCaseMock: ListProductsUseCase {
    var calls: Int = 0
    
    func listProducts() -> [GroLi.Product] {
        self.calls += 1
        return [Product(id: UUID(), name: "test", rank: 0, checked: false)]
    }
}
