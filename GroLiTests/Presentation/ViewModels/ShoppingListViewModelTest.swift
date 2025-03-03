//
//  ShoppingListViewModelTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Testing
@testable import GroLi

struct ShoppingListViewModelTest {
    @Test("Calling loadData")
    func should_call_list_data() {
        // Arrange
        let listProducts = ListProductsUseCaseMock()
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(listProducts.calls == 1)
    }
    
    @Test("Calling loadData")
    func should_put_data_in_local_varable() {
        // Arrange
        let listProducts = ListProductsUseCaseMock()
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(sut.products.count == 1)
    }
    
    @Test("addProduct")
    func should_call_add_product_use_case() {
        // Arrange
        let listProducts = ListProductsUseCaseMock()
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: addProduct)
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(addProduct.calls == 1)
    }
}
