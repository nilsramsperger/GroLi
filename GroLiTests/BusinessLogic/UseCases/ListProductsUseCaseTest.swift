//
//  ListProductsUseCaseTest.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Testing
import Foundation
@testable import GroLi

struct ListProductsUseCaseTest {
    @Test()
    func test_listProducts_should_list_all_products_from_the_repo() {
        // Arrange
        let products = [Product(id: UUID(), name: "P1", rank: 0, checked: false), Product(id: UUID(), name: "P2", rank: 1, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ListProductsUseCase = ListProductsUseCaseImpl(products: repo)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts.count == 3)
    }
    
    @Test()
    func test_listProducts_should_return_the_products_ordered_by_rank() {
        // Arrange
        let products = [Product(id: UUID(), name: "P1", rank: 1, checked: false), Product(id: UUID(), name: "P2", rank: 0, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ListProductsUseCase = ListProductsUseCaseImpl(products: repo)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts[0].name == "P2")
        #expect(actualProducts[1].name == "P1")
        #expect(actualProducts[2].name == "P3")
    }
}
