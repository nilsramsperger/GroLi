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
        let useCase = ListProductsUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: useCase)
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(useCase.calls == 1)
    }
    
    @Test("Calling loadData")
    func should_put_data_in_local_varable() {
        // Arrange
        let useCase = ListProductsUseCaseMock()
        let sut = ShoppingListViewModel(listProducts: useCase)
        
        // Act
        sut.loadData()
        
        // Assert
        #expect(sut.products.count == 1)
    }
}
