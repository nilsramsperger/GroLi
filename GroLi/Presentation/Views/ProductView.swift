//
//  ProductView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 15.04.25.
//
import SwiftUI

struct ProductView: View {
    @Binding var product: Product
    
    var index: Int
    var onDelete: (_ index: Int) -> Void
    
    @State private var isHovering: Bool = false
    
    var body: some View {
        HStack() {
            Toggle(isOn: $product.checked) {}
                .toggleStyle(CheckboxToggleStyle())
                .padding(.leading, 5)
                .padding(.vertical, 5)
            Text(product.name)
            Spacer()
            if(isHovering) {
                Button(action: {  onDelete(index) }) {
                    Image(systemName: "trash")
                }
                .buttonStyle(.plain)
                .padding(.trailing, 5)
            }
        }
        .cornerRadius(8)
        .onHover {
            hovering in isHovering = hovering
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(isHovering ? Color.gray.opacity(0.3) : Color.clear)
        )
    }
}

#if os(macOS)
#Preview {
    @Previewable @State var product = Product(id: UUID(), name: "P1", rank: 0, checked: false)
    @Previewable @State var product2 = Product(id: UUID(), name: "P2", rank: 1, checked: false)
    
    VStack() {
        ProductView(product: $product, index: 0) {index in }
        ProductView(product: $product2, index: 1) {index in }
        Spacer()
    }
    .padding()
}
#endif
