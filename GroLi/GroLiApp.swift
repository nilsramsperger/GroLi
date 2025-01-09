//
//  GroLiApp.swift
//  GroLi
//
//  Created by Nils Ramsperger on 09.01.25.
//

import SwiftUI

@main
struct GroLiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
