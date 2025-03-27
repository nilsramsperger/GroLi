//
//  ReorderProductsUseCaseMock.swift
//  GroLi
//
//  Created by Nils Ramsperger on 27.03.25.
//
import Foundation
@testable import GroLi

class ReorderProductsUseCaseMock: ReorderProductsUseCase {
    var calls: Int = 0
    
    func reorderProducts(byIds ids: [UUID]) {
        calls += 1
    }
}
