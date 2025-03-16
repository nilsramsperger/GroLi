//
//  ShoppingListViewModelTest.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Testing
import Foundation
@testable import GroLi

struct ShoppingListViewModelTest {
    @Test()
    func test_loadData_should_call_list_data() {
        // Arrange
        let listProducts = ListProductsUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(listProducts.calls == 1)
    }
    
    @Test()
    func test_loadData_should_put_data_in_local_varable() {
        // Arrange
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(sut.products.count == 1)
    }
    
    @Test()
    func test_addProduct_should_call_add_product_use_case() {
        // Arrange
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: addProduct, removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.addProduct(name: "Test")
        
        // Assert
        #expect(addProduct.calls == 1)
    }
    
    @Test()
    func test_removeProduct_should_call_remove_product_use_case() {
        // Arrange
        let removeProduct = RemoveProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: removeProduct)
        
        // Act
        sut.removeProduct(withId: UUID())
        
        // Assert
        #expect(removeProduct.calls == 1)
    }
}
