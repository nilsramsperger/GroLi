//
//  ProductsRepository.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Foundation

protocol ProductsRepository {
    func getAll() -> [Product];
    func get(byId id: UUID) -> Product?;
    func add(_ product: Product) -> Void;
    func remove(_ product: Product) -> Void;
    func update(_ product: Product) -> Void;
}
