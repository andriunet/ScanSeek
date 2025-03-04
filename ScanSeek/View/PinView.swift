//
//  PinView.swift
//  ScanSeek
//
//  Created by Andres Marin on 3/03/25.
//

import SwiftUI

struct PinView: View {
    @ObservedObject var viewModel: QRScannerViewModel

    var body: some View {
        VStack {
            Text("Ingrese su PIN")
                .font(.title2)

            SecureField("PIN", text: $viewModel.enteredPin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Validar") {
                viewModel.validatePIN()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
