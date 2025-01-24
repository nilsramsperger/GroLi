//
//  ShopingListView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import SwiftUI

struct ShopingListView: View {
    @EnvironmentObject private var viewModel: ShoppingListViewModel
    
    var body: some View {
        Text("Test")
        List {
            ForEach(viewModel.products) { product in
                Text(product.name)
            }
        }
    }
}
