//
//  ListProductsUseCaseTest.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Testing
@testable import GroLi

struct ListProductsUseCaseTest {
    @Test("Listing the Products")
    func should_list_all_products_from_the_repo() {
        // Arrange
        let products = ProductsRepositoryMock()
        let sut: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts.count == 3)
        #expect(products.calls == 1)
    }
    
    @Test("Listing the Products")
    func should_return_the_products_ordered_by_rank() {
        // Arrange
        let products = ProductsRepositoryMock()
        let sut: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts[0].name == "test")
        #expect(actualProducts[1].name == "test3")
        #expect(actualProducts[2].name == "test2")
    }
}
