//
//  RemoveProductUseCaseImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 12.03.25.
//

import Foundation

struct RemoveProductUseCaseImpl: RemoveProductUseCase {
    var repo: ProductsRepository
    
    init(products: ProductsRepository) {
        repo = products
    }
    
    func removeProduct(withId id: UUID) {
        if let product = repo.get(byId: id) {
            repo.remove(product)
            repo.getAll()
                .sorted { $0.rank < $1.rank }
                .enumerated()
                .map { Product(id: $1.id, name: $1.name, rank: $0, checked: $1.checked) }
                .forEach { repo.update($0) }
        }
    }
}
