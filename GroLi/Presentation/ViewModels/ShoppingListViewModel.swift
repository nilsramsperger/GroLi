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
    
    @Published var products: [Product] = []
    
    init(listProducts: ListProductsUseCase, addProduct: AddProductUseCase) {
        listProductsUseCase = listProducts
        addProductUseCase = addProduct
    }
    
    func loadData() {
        products = listProductsUseCase.listProducts()
    }
    
    func addProduct(name: String) {
        addProductUseCase.addProduct(name: name)
        loadData()
    }
}
