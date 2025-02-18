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
        VStack(alignment: .leading) {
            ForEach(viewModel.products) { product in
                Text(product.name).padding()
            }
        }
    }
}

#Preview {
    ShopingListView().environmentObject(ShoppingListViewModel(mockProducts: [Product(id: UUID(), name: "Bread", rank: 0), Product(id: UUID(), name: "Butter", rank: 1), Product(id: UUID(), name: "Jam", rank: 2)]))
}
