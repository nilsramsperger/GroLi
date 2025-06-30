//
//  ShoppingListViewModelFactory.swift
//  GroLi
//
//  Created by Nils Ramsperger on 16.02.25.
//

import Foundation

protocol ShoppingListViewModelFactory {
    func create(globalViewModel: GlobalViewModel) -> ShoppingListViewModel
}
