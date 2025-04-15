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
        let sut = ShoppingListViewModel(listProducts: listProducts, addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock(), reorderProducts: ReorderProductsUseCaseMock())
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(listProducts.calls == 1)
    }
    
    @Test()
    func test_loadItems_should_put_data_in_local_varable() {
        // Arrange
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock(), reorderProducts: ReorderProductsUseCaseMock())
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(sut.products.count == 1)
    }
    
    @Test()
    func test_addItem_should_call_add_product_use_case() {
        // Arrange
        let addProduct = AddProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: addProduct, removeProduct: RemoveProductUseCaseMock(), reorderProducts: ReorderProductsUseCaseMock())
        
        // Act
        sut.addItem(name: "Test")
        
        // Assert
        #expect(addProduct.calls == 1)
    }
    
    @Test()
    func test_deleteItem_should_call_remove_product_use_case() {
        // Arrange
        let removeProduct = RemoveProductUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: removeProduct, reorderProducts: ReorderProductsUseCaseMock())
        sut.loadItems()
        
        // Act
        sut.deleteItem(at: 0)
        
        // Assert
        #expect(removeProduct.calls == 1)
    }
    
    @Test()
    func test_reorderItems_should_call_reorder_products_use_case() {
        // Arrange
        let reorderProducts = ReorderProductsUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: ListProductsUseCaseMock(), addProduct: AddProductUseCaseMock(), removeProduct: RemoveProductUseCaseMock(), reorderProducts: reorderProducts)
        sut.loadItems()
        
        // Act
        sut.reorderItems()
        
        // Assert
        #expect(reorderProducts.calls == 1)
    }
}
