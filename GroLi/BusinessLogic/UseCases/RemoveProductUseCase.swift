//
//  RemoveProductUseCase.swift
//  GroLi
//
//  Created by Nils Ramsperger on 12.03.25.
//

import Foundation

protocol RemoveProductUseCase {
    func removeProduct(withId id: UUID)
}
