//
//  HassanDatabaseContainer.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import CoreData

class HassanDatabaseContainer {
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "HassanLocalDatabase")
        
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [description]
        } else {
            container.persistentStoreDescriptions.first?.shouldMigrateStoreAutomatically = true
            container.persistentStoreDescriptions.first?.shouldInferMappingModelAutomatically = true
        }
        
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load core data: \(error.localizedDescription)")
            }
        }
    }
}

extension HassanDatabaseContainer {
    static var preview: HassanDatabaseContainer {
        let container = HassanDatabaseContainer(inMemory: true)
        return container
    }
}
