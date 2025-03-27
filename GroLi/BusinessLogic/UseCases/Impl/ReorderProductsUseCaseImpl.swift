//
//  ReorderProductsUseCaseImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 27.03.25.
//

import Foundation

struct ReorderProductsUseCaseImpl: ReorderProductsUseCase {
    var productsRepository: ProductsRepository
    
    func reorderProducts(byIds ids: [UUID]) {
        var index = 0
        ids.forEach { id in
            if let product = productsRepository.get(byId: id) {
                productsRepository.update(Product(id: product.id, name: product.name, rank: index, checked: product.checked))
                index += 1
            }
        }
    }
}
