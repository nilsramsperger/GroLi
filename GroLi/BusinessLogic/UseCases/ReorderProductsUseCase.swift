//
//  ReorderProductsUseCase.swift
//  GroLi
//
//  Created by Nils Ramsperger on 27.03.25.
//

import Foundation

protocol ReorderProductsUseCase {
    func reorderProducts(byIds ids: [UUID])
}
