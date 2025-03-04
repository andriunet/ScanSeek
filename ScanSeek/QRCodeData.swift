//
//  QRCodeData.swift
//  ScanSeek
//
//  Created by Andres Marin on 28/02/25.
//

import CoreData

struct QRCodeData {
    static let shared = QRCodeData()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ScannedCode")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error al cargar Core Data: \(error), \(error.userInfo)")
            }
        }
    }
    var context: NSManagedObjectContext {
        return container.viewContext
    }
}
