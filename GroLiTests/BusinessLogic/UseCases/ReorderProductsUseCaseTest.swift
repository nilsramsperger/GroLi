//
//  ReorderProductsUseCaseTest.swift
//  GroLi
//
//  Created by Nils Ramsperger on 27.03.25.
//

import Testing
import Foundation
@testable import GroLi

struct ReorderProductsUseCaseTest {
    @Test
    func test_reorderProducts_should_alter_the_order_of_the_products_in_the_repo() {
        // Arrange
        let expectedUUID1 = UUID()
        let expectedUUID2 = UUID()
        let expectedUUID3 = UUID()
        let products = [
            Product(id: expectedUUID1, name: "P1", rank: 0, checked: false),
            Product(id: expectedUUID2, name: "P2", rank: 1, checked: true),
            Product(id: expectedUUID3, name: "P3", rank: 2, checked: false)]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut = ReorderProductsUseCaseImpl(productsRepository: repo)
        
        // Act
        sut.reorderProducts(byIds: [expectedUUID3, expectedUUID1, expectedUUID2])
        
        // Assert
        #expect(repo.get(byId: expectedUUID1)?.rank == 1)
        #expect(repo.get(byId: expectedUUID2)?.rank == 2)
        #expect(repo.get(byId: expectedUUID3)?.rank == 0)
    }
}
