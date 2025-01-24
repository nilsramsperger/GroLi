//
//  ListProductsUseCaseImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Foundation

struct ListProductsUseCaseImpl: ListProductsUseCase {
    var products: ProductsRepository
    
    init(products: ProductsRepository) {
        self.products = products
    }
    
    func listProducts() -> [Product] {
        return products.getAll()
    }
}
