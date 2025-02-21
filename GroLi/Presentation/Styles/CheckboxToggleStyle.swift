//
//  CheckboxToggleStyle.swift
//  GroLi
//
//  Created by Nils Ramsperger on 20.02.25.
//


import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                    .animation(.easeInOut(duration: 0.1), value: configuration.isOn)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
