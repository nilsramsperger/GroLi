//
//  ProductsRepository.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Foundation

protocol ProductsRepository {
    func getAll() throws -> [Product];
    func get(byId id: UUID) throws -> Product?;
    func add(_ product: Product) throws -> Void;
    func remove(_ product: Product) throws -> Void;
    func update(_ product: Product) throws -> Void;
}
