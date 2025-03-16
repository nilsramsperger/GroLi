//
//  Product.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id: UUID
    var name: String
    var rank: Int
    var checked: Bool
}
