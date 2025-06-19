//
//  ShoppingListUseCasesImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 29.04.25.
//

import Foundation
import os

struct ShoppingListUseCasesImpl: ShoppingListUseCases {
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ShoppingListUseCasesImpl")
    
    private let productNameMaxLength = 40
    
    var products: ProductsRepository

    func listProducts() throws -> [Product] {
        do {
            return try products.getAll().sorted { $0.rank < $1.rank }
        } catch {
            Self.logger.fault("Action failed: \(error.localizedDescription, privacy: .public)")
            throw DataError.persistenceFailed
        }
    }

    func addProduct(name: String) throws {
        do {
            if name.isEmpty {
                return
            }

            if name.count > productNameMaxLength {
                throw ValidationError.stringTooLong
            }

            let maxRank =
                try products.getAll().max(by: { $0.rank < $1.rank })?.rank ?? 0
            let newProduct = Product(
                id: UUID(),
                name: name,
                rank: maxRank + 1,
                checked: false
            )
            try products.add(newProduct)
        } catch {
            Self.logger.fault("Action failed: \(error.localizedDescription, privacy: .public)")
            throw DataError.persistenceFailed
        }
    }

    func removeProduct(withId id: UUID) throws {
        do {
            if let product = try products.get(byId: id) {
                try products.remove(product)
                try products.getAll()
                    .sorted { $0.rank < $1.rank }
                    .enumerated()
                    .map {
                        Product(
                            id: $1.id,
                            name: $1.name,
                            rank: $0,
                            checked: $1.checked
                        )
                    }
                    .forEach { try products.update($0) }
            }
        } catch {
            Self.logger.fault("Action failed: \(error.localizedDescription, privacy: .public)")
            throw DataError.persistenceFailed
        }
    }

    func reorderProducts(byIds ids: [UUID]) throws {
        do {
            var index = 0
            try ids.forEach { id in
                if let product = try products.get(byId: id) {
                    try products.update(
                        Product(
                            id: product.id,
                            name: product.name,
                            rank: index,
                            checked: product.checked
                        )
                    )
                    index += 1
                }
            }
        } catch {
            Self.logger.fault("Action failed: \(error.localizedDescription, privacy: .public)")
            throw DataError.persistenceFailed
        }
    }

    func toggleProductChecked(of id: UUID) throws {
        do {
            if let product = try products.get(byId: id) {
                try products.update(
                    Product(
                        id: product.id,
                        name: product.name,
                        rank: product.rank,
                        checked: !product.checked
                    )
                )
            }
        } catch {
            Self.logger.fault("Action failed: \(error.localizedDescription, privacy: .public)")
            throw DataError.persistenceFailed
        }
    }
}
