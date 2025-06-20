//
//  DataController.swift
//  GroLi
//
//  Created by Nils Ramsperger on 20.05.25.
//
import CoreData

class DataController: ObservableObject {
    lazy var container: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "GroLi")
        let description = container.persistentStoreDescriptions.first
        description?.setOption(true as NSNumber, forKey: NSInferMappingModelAutomaticallyOption)
        description?.setOption(true as NSNumber, forKey: NSMigratePersistentStoresAutomaticallyOption)
        
        container.loadPersistentStores { _, error in
            if let error {
                // Löschen der alten Datenbank bei schwerwiegenden Fehlern
                if let url = description?.url {
                    try? FileManager.default.removeItem(at: url)
                    container.loadPersistentStores { _, retryError in
                        if let retryError {
                            fatalError("Failed to load persistent stores after retry: \(retryError.localizedDescription) \(#file) \(#line)")
                        }
                    }
                } else {
                    fatalError("Failed to load persistent stores: \(error.localizedDescription) \(#file) \(#line)")
                }
            }
        }
        return container
    }()
}
