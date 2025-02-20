//
//  ShopingListView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject private var viewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.products) { product in
                Text(product.name).padding()
            }
        }
    }
}

struct ShoppingListViewPreviewData: PreviewModifier {
    static func makeSharedContext() -> ShoppingListViewModel {
        let viewModel = ShoppingListViewModel(listProducts: ListProductsUseCaseMock())
        viewModel.loadData()
        return viewModel
    }
    
    func body(content: Content, context: ShoppingListViewModel) -> some View {
            content
            .environmentObject(context)
        }
}

#Preview(traits: .modifier(ShoppingListViewPreviewData())) {
    ShoppingListView()
}
