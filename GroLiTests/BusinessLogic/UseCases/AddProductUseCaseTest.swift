//
//  AddProductUseCaseTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Testing
import Foundation
@testable import GroLi

struct AddProductUseCaseTest {
    @Test()
    func test_addProduct_should_add_one_product_to_the_repo() {
        // Arrange
        let repo = ProductsInMemoryRepositoryImpl(withProducts: [])
        let sut: AddProductUseCase = AddProductUseCaseImpl(products: repo)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(repo.getAll().count == 1)
    }
    
    @Test()
    func test_addProduct_should_create_a_new_product_with_correct_values() {
        // Arrange
        let products = [Product(id: UUID(), name: "P1", rank: 1, checked: false), Product(id: UUID(), name: "P2", rank: 0, checked: true), Product(id: UUID(), name: "P3", rank: 2, checked: false)]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: AddProductUseCase = AddProductUseCaseImpl(products: repo)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(repo.getAll()[3] != nil)
        #expect(repo.getAll()[3].id.uuidString.count == 36)
        #expect(repo.getAll()[3].name == "Test")
        #expect(repo.getAll()[3].checked == false)
        #expect(repo.getAll()[3].rank == 3)
    }
}
