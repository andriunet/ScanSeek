//
//  ScanSeekApp.swift
//  ScanSeek
//
//  Created by Andres Marin on 27/02/25.
//

import SwiftUI

@main
struct ScanSeekApp: App {
    let QRCodeDataController = QRCodeData.shared
    
    var body: some Scene {
        WindowGroup {
            InicioView().environment(\.managedObjectContext, QRCodeDataController.context)
        }
    }
}
