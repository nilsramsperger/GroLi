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
    func test_loadItems_should_call_list_data() {
        // Arrange
        let listProducts = ListProductsUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(listProducts.calls == 1)
    }
    
    @Test()
    func test_loadItems_should_put_data_in_local_varable() {
        // Arrange
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(sut.products.count == 1)
    }
    
    @Test()
    func test_addItem_should_call_add_product_use_case() {
        // Arrange
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: addProduct, removeProduct: RemoveProductUseCaseMock())
        
        // Act
        sut.addItem(name: "Test")
        
        // Assert
        #expect(addProduct.calls == 1)
    }
    
    @Test()
    func test_deleteItems_should_call_remove_product_use_case() {
        // Arrange
        let removeProduct = RemoveProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: removeProduct)
        sut.loadItems()
        
        // Act
        sut.deleteItems(at: [0])
        
        // Assert
        #expect(removeProduct.calls == 1)
    }
}
