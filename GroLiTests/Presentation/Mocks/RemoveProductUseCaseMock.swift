//
//  RemoveProductUseCaseMock.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 16.03.25.
//

import Foundation
@testable import GroLi

class RemoveProductUseCaseMock: RemoveProductUseCase {
    var calls: Int = 0
    
    func removeProduct(withId id: UUID) {
        calls += 1
    }
}
