//
//  AddProductUseCaseMock.swift
//  GroLiTests
//
//  Created by Nils Ramsperger on 03.03.25.
//

import Foundation
@testable import GroLi

class AddProductUseCaseMock: AddProductUseCase {
    var calls: Int = 0
    
    func addProduct(name: String) {
        calls += 1
    }
}
