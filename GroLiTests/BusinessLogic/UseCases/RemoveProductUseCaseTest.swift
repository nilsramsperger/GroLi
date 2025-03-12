//
//  RemoveProductUseCaseTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 12.03.25.
//

import Testing
import Foundation
@testable import GroLi

struct RemoveProductUseCaseTest {
    @Test()
    func test_removeProduct_should_remove_the_product_from_the_repo() {
        // Arrange
        let products = [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut = RemoveProductUseCaseImpl(products: repo)
        
        // Act
        sut.repo.remove(products[1])
        
        // Assert
        #expect(repo.getAll().count == 2)
        #expect(repo.getAll()[0].name == "P1")
        #expect(repo.getAll()[1].name == "P3")
    }
    
    // ToDo: Add more Tests
}
