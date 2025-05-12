//
//  ShoppingListUseCases.swift
//  GroLi
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Foundation

protocol ShoppingListUseCases {
    func listProducts() -> [Product]
    func addProduct(name: String)
    func removeProduct(withId id: UUID)
    func reorderProducts(byIds ids: [UUID])
    func toggleProductChecked(of id: UUID)
}
