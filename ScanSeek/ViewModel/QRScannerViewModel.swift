//
//  QRScannerViewModel.swift
//  ScanSeek
//
//  Created by Andres Marin on 28/02/25.
//

import Foundation
import LocalAuthentication

class QRScannerViewModel: ObservableObject {
    @Published var scannedCode: String?
    @Published var isAuthenticated = false
    @Published var showPinInput = false
    @Published var enteredPin = ""
    @Published var errorMessage: String?
    
    private let context = QRCodeData.shared.context
    private let pinKey = "userPIN"
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Necesitamos verificar tu identidad") { success, _ in
                DispatchQueue.main.async {
                    self.isAuthenticated = success
                    if !success {
                        self.showPinInput = true
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.showPinInput = true
            }
        }
    }
    
    func validatePIN() {
        if enteredPin == getPIN() {
            isAuthenticated = true
            showPinInput = false
            errorMessage = nil // Limpiar mensaje de error
        } else {
            errorMessage = "PIN incorrecto. Inténtalo de nuevo"
        }
    }
    
    func saveScannedCode(_ code: String) {
        let newCode = ScannedCode(context: context)
        newCode.value = code
        newCode.date = Date()
        
        do {
            try context.save()
        } catch {
            print("Error guardando el código: \(error.localizedDescription)")
        }
    }
    
    func savePIN(_ pin: String) {
        KeychainManager.shared.save(pin, forKey: pinKey)
    }
    
    func getPIN() -> String {
        return KeychainManager.shared.get(forKey: pinKey) ?? "1234" // PIN por defecto es 1234
    }
}


