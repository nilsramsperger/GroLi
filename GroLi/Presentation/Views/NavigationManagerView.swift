//
//  NavigationManagerMacView.swift
//  GroLi
//
//  Created by Nils Ramsperger on 07.03.25.
//

import SwiftUI

struct NavigationManagerView: View {
    @State private var items = ["Aldi"]
    @State private var selection: String? = "misc"
    @State private var sideBarVisibility: NavigationSplitViewVisibility = .doubleColumn
    
    @EnvironmentObject private var globalViewModel: GlobalViewModel
    
    var body: some View {
        NavigationSplitView(columnVisibility: $sideBarVisibility) {
            HStack() {
                Text("Shops", comment: "Headline of list of shops")
                Spacer()
                Image(systemName: "chevron.down")
            }.padding()
            List(selection: $selection) {
                NavigationLink(value: "misc") {
                    Text("MiscListHeader", comment: "Navigation link to the miscellaneous list")
                }
                ForEach(items, id: \.self) { item in
                    NavigationLink(value: item) {
                        Text(item)
                    }
                }
            }
        } detail: {
            if (selection == "misc") {
                ShoppingListView()
            } else {
                Text("Unknown")
            }
        }.fullScreenCover(isPresented: .constant(!globalViewModel.nonDismissableMessage.isEmpty)) {
            NonDismissableMessageView()
        }
            
            
    }
}

#Preview(traits: .modifier(ShoppingListViewPreviewData())) {
    NavigationManagerView()
}
