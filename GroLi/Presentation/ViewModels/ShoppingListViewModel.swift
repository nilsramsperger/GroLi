//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    let listProductsUseCase: ListProductsUseCase
    let addProductUseCase: AddProductUseCase
    let removeProductUseCase: RemoveProductUseCase
    
    @Published var products: [Product] = []
    
    init(listProducts: ListProductsUseCase, addProduct: AddProductUseCase, removeProduct: RemoveProductUseCase) {
        listProductsUseCase = listProducts
        addProductUseCase = addProduct
        removeProductUseCase = removeProduct
    }
    
    func loadData() {
        products = listProductsUseCase.listProducts()
    }
    
    func addProduct(name: String) {
        addProductUseCase.addProduct(name: name)
        loadData()
    }
    
    func removeProduct(withId id: UUID) {
        removeProductUseCase.removeProduct(withId: id)
        loadData()
    }
}
