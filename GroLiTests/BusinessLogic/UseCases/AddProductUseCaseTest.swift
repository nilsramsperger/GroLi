//
//  AddProductUseCaseTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Testing
@testable import GroLi

struct AddProductUseCaseTest {
    @Test("Adding a product")
    func should_call_the_add_method_of_the_repository() {
        // Arrange
        let products = ProductsRepositoryMock()
        let sut: AddProductUseCase = AddProductUseCaseImpl(products: products)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(products.addCalls == 1)
    }
    
    @Test("Adding a product")
    func should_create_a_new_product_with_correct_values() {
        // Arrange
        let products = ProductsRepositoryMock()
        let sut: AddProductUseCase = AddProductUseCaseImpl(products: products)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(products.lastAddedProduct != nil)
        #expect(products.lastAddedProduct!.id.uuidString.count == 36)
        #expect(products.lastAddedProduct!.name == "Test")
        #expect(products.lastAddedProduct!.checked == false)
        #expect(products.lastAddedProduct!.rank == 3)
    }
}
