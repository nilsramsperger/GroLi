//
//  ProductsCoreDataRepositoryImpl.swift
//  GroLi
//
//  Created by Nils Ramsperger on 20.05.25.
//

import CoreData

struct ProductsCoreDataRepositoryImpl: ProductsRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func getAll() throws -> [Product] {
        let fetchRequest: NSFetchRequest<ProductEntity> =
            ProductEntity.fetchRequest()

        let products = try context.fetch(fetchRequest)
        return products.map {
            Product(
                id: $0.id!,
                name: $0.name!,
                rank: Int($0.rank),
                checked: $0.checked
            )
        }
    }

    func get(byId id: UUID) throws -> Product? {
        let fetchRequest: NSFetchRequest<ProductEntity> =
            ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        let products = try context.fetch(fetchRequest)
        return products.first.map {
            Product(
                id: $0.id!,
                name: $0.name!,
                rank: Int($0.rank),
                checked: $0.checked
            )
        }
    }

    func add(_ product: Product) throws {
        do {
            let newProduct = ProductEntity(context: context)
            newProduct.id = product.id
            newProduct.name = product.name
            newProduct.rank = Int16(product.rank)
            newProduct.checked = product.checked
            try context.save()
        } catch {
            context.rollback()
            throw error
        }
    }

    func remove(_ product: Product) throws {
        do {
            let fetchRequest: NSFetchRequest<ProductEntity> =
                ProductEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "id == %@",
                product.id as CVarArg
            )

            let products = try context.fetch(fetchRequest)
            if let productToDelete = products.first {
                context.delete(productToDelete)
                try context.save()
            }
        } catch {
            context.rollback()
            throw error
        }
    }

    func update(_ product: Product) throws {
        do {
            let fetchRequest: NSFetchRequest<ProductEntity> =
                ProductEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "id == %@",
                product.id as CVarArg
            )

            let products = try context.fetch(fetchRequest)
            if let productToUpdate = products.first {
                productToUpdate.name = product.name
                productToUpdate.rank = Int16(product.rank)
                productToUpdate.checked = product.checked
                try context.save()
            }
        } catch {
            context.rollback()
            throw error
        }
    }
}
