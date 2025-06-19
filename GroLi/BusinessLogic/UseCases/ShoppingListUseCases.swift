//
//  ShoppingListUseCases.swift
//  GroLi
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Foundation

protocol ShoppingListUseCases {
    func listProducts() throws -> [Product]
    func addProduct(name: String) throws
    func removeProduct(withId id: UUID) throws
    func reorderProducts(byIds ids: [UUID]) throws
    func toggleProductChecked(of id: UUID) throws
}
