//
//  AddProductSheet.swift
//  GroLi
//
//  Created by Nils Ramsperger on 19.05.25.
//

import Combine
import SwiftUI
import SwiftUICore

struct AddProductSheet: View {
    private let productNameMaxLength = 40

    @EnvironmentObject private var viewModel: ShoppingListViewModel

    @Environment(\.dismiss) private var dismiss

    @State private var productName: String = ""
    @State private var contentHeight: CGFloat = 0

    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            TextField("WhatToBuy", text: $productName)
                .padding()
                .focused($isTextFieldFocused)
                .textFieldStyle(.roundedBorder)
                .onReceive(Just(productName)) { _ in
                    if productName.count > productNameMaxLength {
                        productName = String(
                            productName.prefix(productNameMaxLength)
                        )
                    }
                }
        }
        .onSubmit {
            viewModel.addItem(name: productName)
            dismiss()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isTextFieldFocused = true
            }
        }
        .background(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    contentHeight = proxy.size.height
                }
            }
        )
        .presentationDetents([.height(contentHeight)])
    }
}
