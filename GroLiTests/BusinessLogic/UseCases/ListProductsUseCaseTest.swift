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
    func should_list_all_products_from_the_repo() async throws {
        // Arrange
        let products = ProductsRepositoryMock()
        let sut: ListProductsUseCase = ListProductsUseCaseImpl(products: products)
        
        // Act
        let actualProducts: [Product] = try await sut.listProducts()
        
        // Assert
        #expect(actualProducts.count == 3)
        #expect(products.calls == 1)
    }
}
