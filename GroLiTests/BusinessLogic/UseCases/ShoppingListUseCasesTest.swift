//
//  ShoppingListUseCasesTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Testing
import Foundation
@testable import GroLi

struct ShoppingListUseCasesTest {
    @Test()
    func test_addProduct_should_add_one_product_to_the_repo() {
        // Arrange
        let repo = ProductsInMemoryRepositoryImpl(withProducts: [])
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(repo.getAll().count == 1)
    }
    
    @Test()
    func test_addProduct_should_create_a_new_product_with_correct_values() {
        // Arrange
        let products = [
            Product(id: UUID(), name: "P1", rank: 1, checked: false),
            Product(id: UUID(), name: "P2", rank: 0, checked: true),
            Product(id: UUID(), name: "P3", rank: 2, checked: false)
        ]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(repo.getAll()[3].id.uuidString.count == 36)
        #expect(repo.getAll()[3].name == "Test")
        #expect(repo.getAll()[3].checked == false)
        #expect(repo.getAll()[3].rank == 3)
    }
    
    @Test()
    func test_listProducts_should_list_all_products_from_the_repo() {
        // Arrange
        let products = [
            Product(id: UUID(), name: "P1", rank: 0, checked: false),
            Product(id: UUID(), name: "P2", rank: 1, checked: true),
            Product(id: UUID(), name: "P3", rank: 2, checked: false)
        ]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts.count == 3)
    }
    
    @Test()
    func test_listProducts_should_return_the_products_ordered_by_rank() {
        // Arrange
        let products = [
            Product(id: UUID(), name: "P1", rank: 1, checked: false),
            Product(id: UUID(), name: "P2", rank: 0, checked: true),
            Product(id: UUID(), name: "P3", rank: 2, checked: false)
        ]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        let actualProducts: [Product] = sut.listProducts()
        
        // Assert
        #expect(actualProducts[0].name == "P2")
        #expect(actualProducts[1].name == "P1")
        #expect(actualProducts[2].name == "P3")
    }
    
    @Test()
    func test_removeProduct_should_remove_the_product_from_the_repo() {
        // Arrange
        let products = [
            Product(id: UUID(), name: "P1", rank: 0, checked: false),
            Product(id: UUID(), name: "P2", rank: 1, checked: true),
            Product(id: UUID(), name: "P3", rank: 2, checked: false)
        ]
        let repo = ProductsInMemoryRepositoryImpl(withProducts: products)
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        sut.removeProduct(withId: products[1].id)
        
        // Assert
        #expect(repo.getAll().count == 2)
        #expect(repo.getAll()[0].name == "P1")
        #expect(repo.getAll()[1].name == "P3")
    }
    
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
        let sut: ShoppingListUseCases = ShoppingListUseCasesImpl(products: repo)
        
        // Act
        sut.reorderProducts(byIds: [expectedUUID3, expectedUUID1, expectedUUID2])
        
        // Assert
        #expect(repo.get(byId: expectedUUID1)?.rank == 1)
        #expect(repo.get(byId: expectedUUID2)?.rank == 2)
        #expect(repo.get(byId: expectedUUID3)?.rank == 0)
    }
}
