//
//  ShopingListView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 23.01.25.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShoppingListView: View {
    var body: some View {
        #if os(iOS)
        ShoppingListIOSView()
        #else
        ShoppingListMacOSView()
        #endif
    }
}

struct ShoppingListIOSView: View {
    @State private var showAddProductSheet: Bool = false
    @State private var dragging: Product?
    @State private var swipedIndex: Int? = nil
    
    @EnvironmentObject private var viewModel: ShoppingListViewModel
    
    var body: some View {
        ZStack() {
            VStack() {
                HStack() {
                    Text("ShoppingListHeader", comment: "Headline of the ShoppingList")
                        .font(.title)
                        .padding(.bottom, 10)
                    Spacer()
                }
                ForEach(viewModel.products.indices, id: \.self) { index in
                    SwipeableProductView(product: $viewModel.products[index], swipedIndex: $swipedIndex, index: index) { index in
                        viewModel.deleteItem(at: index)
                        swipedIndex = nil
                    }
                    .onDrag {
                        dragging = viewModel.products[index]
                        return NSItemProvider(object: viewModel.products[index].id.uuidString as NSString)
                    }
                    .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: viewModel.products[index], draggedItem: $dragging, items: $viewModel.products, handleReorder: viewModel.reorderItems))
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
                        AddProductSheet()
                    }
                }.padding()
            }.padding()
        }
    }
}

struct ShoppingListMacOSView: View {
    @State private var showAddProductSheet: Bool = false
    @State private var hoverIndex: Int? = nil
    @State private var dragging: Product?
    
    @EnvironmentObject private var viewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack() {
                Text("ShoppingListHeader", comment: "Headline of the ShoppingList")
                    .font(.title)
                    .padding(.bottom, 10)
                Spacer()
            }
            ForEach(viewModel.products.indices, id: \.self) { index in
                ProductView(product: $viewModel.products[index], index: index) { index in
                    viewModel.deleteItem(at: index)
                }
                .onDrag {
                    dragging = viewModel.products[index]
                    return NSItemProvider(object: viewModel.products[index].id.uuidString as NSString)
                }
                .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: viewModel.products[index], draggedItem: $dragging, items: $viewModel.products, handleReorder: viewModel.reorderItems))
            }
            Spacer()
        }.padding()
            .toolbar {
                ToolbarItem() {
                    Button(action: { showAddProductSheet = true }) {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("n")
                    .sheet(isPresented: $showAddProductSheet) {
                        AddProductSheet()
                    }
                }
            }
    }
}

struct DragRelocateDelegate: DropDelegate {
    let item: Product
    @Binding var draggedItem: Product?
    @Binding var items: [Product]
    let handleReorder: () -> Void
    
    func dropEntered(info: DropInfo) {
        if item != draggedItem {
            let from = items.firstIndex(of: draggedItem!)!
            let to = items.firstIndex(of: item)!
            if items[to].id != draggedItem!.id {
                items.move(fromOffsets: IndexSet(integer: from),
                    toOffset: to > from ? to + 1 : to)
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        handleReorder()
        return true
    }
}

struct ShoppingListViewPreviewData: PreviewModifier {
    static func makeSharedContext() -> ShoppingListViewModel {
        let factory: ShoppingListViewModelFactory = ShoppingListPreViewModelFactoryImpl()
        let viewModel: ShoppingListViewModel = factory.create()
        viewModel.loadItems()
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
