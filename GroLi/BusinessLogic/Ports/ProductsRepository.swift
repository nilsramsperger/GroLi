//
//  ProductsRepository.swift
//  GroLi
//
//  Created by Nils Ramsperger on 22.01.25.
//

import Foundation

protocol ProductsRepository {
    func getAll() -> [Product];
}
