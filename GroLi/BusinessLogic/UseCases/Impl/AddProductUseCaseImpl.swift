//
//  AddProductUseCaseImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Foundation

struct AddProductUseCaseImpl: AddProductUseCase {
    var products: ProductsRepository
    
    init(products: ProductsRepository) {
        self.products = products
    }
    
    func addProduct(name: String) {
        let maxRank = self.products.getAll().max(by: { $0.rank < $1.rank })?.rank ?? 0
        let newProduct = Product(id: UUID(), name: name, rank: maxRank + 1, checked: false)
        self.products.add(newProduct)
    }
}
