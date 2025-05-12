//
//  ShoppingListUseCasesMock.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Foundation
@testable import GroLi

class ShoppingListUseCasesMock: ShoppingListUseCases {
    var addCalls: Int = 0
    var listCalls: Int = 0
    var removeCalls: Int = 0
    var reorderCalls: Int = 0
    var toggleCalls: Int = 0
    
    func addProduct(name: String) {
        addCalls += 1
    }
    
    func listProducts() -> [GroLi.Product] {
        self.listCalls += 1
        return [Product(id: UUID(), name: "test", rank: 0, checked: false)]
    }
    
    func removeProduct(withId id: UUID) {
        removeCalls += 1
    }
    
    func reorderProducts(byIds ids: [UUID]) {
        reorderCalls += 1
    }
    
    func toggleProductChecked(of id: UUID) {
        toggleCalls += 1
    }
}
