//
//  ShoppingListViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import Combine
import Foundation

class ShoppingListViewModel: ObservableObject {
    let shoppingListUseCases: ShoppingListUseCases

    @Published var products: [Product] = []

    private var cancellables = Set<AnyCancellable>()
    private var globalViewModel: GlobalViewModel

    init(
        shoppingListUseCases: ShoppingListUseCases,
        globalViewModel: GlobalViewModel
    ) {
        self.shoppingListUseCases = shoppingListUseCases
        self.globalViewModel = globalViewModel
        $products
            .sink(receiveValue: { [weak self] newValue in
                guard let self = self else { return }
                for newProduct in newValue {
                    if let existingProduct = self.products.first(where: {
                        $0.id == newProduct.id
                    }),
                        existingProduct.checked != newProduct.checked
                    {
                        do {
                            try self.shoppingListUseCases.toggleProductChecked(
                                of: newProduct.id
                            )
                        } catch {
                            globalViewModel.showPersistenceError()
                        }
                    }
                }
            })
            .store(in: &cancellables)
    }

    func loadItems() {
        do {
            products = try shoppingListUseCases.listProducts()
        } catch {
            globalViewModel.showPersistenceError()
        }
    }

    func addItem(name: String) {
        do {
            try shoppingListUseCases.addProduct(name: name)
            loadItems()
        } catch let error as ValidationError {
            globalViewModel.showValidationError(error: error)
        } catch {
            globalViewModel.showPersistenceError()
        }
    }

    func deleteItem(at index: Int) {
        do {
            if let idToDelete = products.indices.contains(index)
                ? products[index].id : nil
            {
                try shoppingListUseCases.removeProduct(withId: idToDelete)
            }
            loadItems()
        } catch {
            globalViewModel.showPersistenceError()
        }
    }

    func reorderItems() {
        do {
            try shoppingListUseCases.reorderProducts(
                byIds: products.map { $0.id }
            )
            loadItems()
        } catch {
            globalViewModel.showPersistenceError()
        }
    }
}
