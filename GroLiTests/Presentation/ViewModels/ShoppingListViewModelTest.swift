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
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(shoppingListUseCases.listCalls == 1)
    }
    
    @Test()
    func test_loadItems_should_put_data_in_local_varable() {
        // Arrange
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        
        // Act
        sut.loadItems()
        
        // Assert
        #expect(sut.products.count == 1)
    }
    
    @Test()
    func test_addItem_should_call_add_product_use_case() {
        // Arrange
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        
        // Act
        sut.addItem(name: "Test")
        
        // Assert
        #expect(shoppingListUseCases.addCalls == 1)
    }
    
    @Test()
    func test_deleteItem_should_call_remove_product_use_case() {
        // Arrange
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        sut.loadItems()
        
        // Act
        sut.deleteItem(at: 0)
        
        // Assert
        #expect(shoppingListUseCases.removeCalls == 1)
    }
    
    @Test()
    func test_reorderItems_should_call_reorder_products_use_case() {
        // Arrange
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        sut.loadItems()
        
        // Act
        sut.reorderItems()
        
        // Assert
        #expect(shoppingListUseCases.reorderCalls == 1)
    }
    
    @Test()
    func test_changing_the_checked_field_of_a_product_should_call_the_toggleProductChecked_method_of_the_use_case() {
        // Arrange
        let shoppingListUseCases = ShoppingListUseCasesMock()
        let sut = createViewModel(shoppingListUseCases: shoppingListUseCases)
        sut.loadItems()
        
        // Act
        sut.products = [Product(id: sut.products[0].id, name: sut.products[0].name, rank: sut.products[0].rank, checked: !sut.products[0].checked)]
        
        // Assert
        #expect(shoppingListUseCases.toggleCalls == 1)
    }
    
    func createViewModel(shoppingListUseCases: ShoppingListUseCases) -> ShoppingListViewModel {
        let globalViewModel = GlobalViewModel()
        return ShoppingListViewModel(shoppingListUseCases: shoppingListUseCases, globalViewModel: globalViewModel)
    }
}
