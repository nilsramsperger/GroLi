//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    let listProductsUseCase: ListProductsUseCase
    
    @Published var products: [Product] = []
    
    init(listProducts: ListProductsUseCase) {
        listProductsUseCase = listProducts
    }
    
    func loadData() {
        products = listProductsUseCase.listProducts()
    }
}
