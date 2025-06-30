//
//  NonDismissableMessageView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 30.06.25.
//

import SwiftUICore

struct NonDismissableMessageView: View {
    @EnvironmentObject private var globalViewModel: GlobalViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding()
            Text(globalViewModel.nonDismissableMessage).padding()
        }
    }
}
