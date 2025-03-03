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
            Text("ShoppingListHeader", comment: "Headline of the ShoppingList")
                .font(.title)
                .padding(.bottom, 10)
            ForEach($viewModel.products) { $product in
                HStack() {
                    Toggle(isOn: $product.checked) {}
                        .toggleStyle(CheckboxToggleStyle())
                    Text(product.name)
                    Spacer()
                }
                .padding(.bottom, 0.25)
            }
            Spacer()
        }.padding()
    }
}

struct ShoppingListViewPreviewData: PreviewModifier {
    static func makeSharedContext() -> ShoppingListViewModel {
        let factory: ShoppingListViewModelFactory = ShoppingListPreViewModelFactoryImpl()
        let viewModel: ShoppingListViewModel = factory.create()
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
