//
//  ShopingListView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject private var viewModel: ShoppingListViewModel
    
    @State private var showAddProductSheet: Bool = false
    
    var body: some View {
        ZStack() {
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
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
                    Button(action: { showAddProductSheet = true }){
                        Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .padding()
                                        .background(Circle().fill(.green))
                                        .foregroundColor(.white)
                    }.sheet(isPresented: $showAddProductSheet) {
                        AddProductSheet().presentationDetents([.fraction(0.2)])
                    }
                }.padding()
            }.padding()
        }
    }
}

struct AddProductSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var productName: String = ""
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack() {
            TextField("NewItem", text: $productName)
                .padding()
                .focused($isTextFieldFocused)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isTextFieldFocused = true
            }
        }
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
