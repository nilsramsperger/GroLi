//
//  ItemView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 08.04.25.
//

import SwiftUI

struct SwipeableProductView: View {
    @Binding var product: Product
    @Binding var swipedIndex: Int?
    
    var index: Int
    var onDelete: (_ index: Int) -> Void
    
    @State private var offsetX: CGFloat = 0
    
    var body: some View {
        ZStack() {
            HStack() {
                Spacer()
                Button(action: { onDelete(index) }) {
                    Image(systemName: "trash")
                        .padding()
                        
                }
                .background(Color.red)
                .cornerRadius(8)
            }
            HStack() {
                Toggle(isOn: $product.checked) {}
                    .toggleStyle(CheckboxToggleStyle())
                Text(product.name)
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .offset(x: offsetX)
            .animation(.easeInOut(duration: 0.1), value: offsetX)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offsetX = min(0, max(-60, gesture.translation.width))
                        swipedIndex = nil
                    }
                    .onEnded { _ in
                        if offsetX < -30 {
                            swipedIndex = index
                        } else {
                            swipedIndex = nil
                            offsetX = 0
                        }
                    }
            )
        }
        .onChange(of: swipedIndex) { oldValue, newValue in
            if newValue == index {
                offsetX = -60
            } else {
                offsetX = 0
            }
        }
    }
}

#Preview {
    @Previewable @State var product = Product(id: UUID(), name: "P1", rank: 0, checked: false)
    @Previewable @State var product2 = Product(id: UUID(), name: "P2", rank: 1, checked: false)
    @Previewable @State var swipedIndex: Int? = nil
    
    VStack() {
        SwipeableProductView(product: $product, swipedIndex: $swipedIndex, index: 0) {index in }
        SwipeableProductView(product: $product2, swipedIndex: $swipedIndex, index: 1) {index in }
        Spacer()
    }
    .padding()
}
