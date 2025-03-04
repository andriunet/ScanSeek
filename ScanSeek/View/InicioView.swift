//
//  InicioView.swift
//  ScanSeek
//
//  Created by Andres Marin on 28/02/25.
//

import SwiftUI

struct InicioView: View {
    @StateObject private var viewModel = QRScannerViewModel()

      var body: some View {
          NavigationView {
              VStack(spacing: 20) {
                  if viewModel.isAuthenticated {
                      Text("Escanea un código QR")
                          .font(.title2)
                          .fontWeight(.bold)

                      ZStack {
                          RoundedRectangle(cornerRadius: 16)
                              .stroke(Color.blue, lineWidth: 3)
                              .frame(width: 300, height: 300)

                          QRScannerView(scannedCode: $viewModel.scannedCode)
                              .frame(width: 300, height: 300)
                              .clipShape(RoundedRectangle(cornerRadius: 16))
                      }

                      if let code = viewModel.scannedCode {
                          Text("QR escaneado:")
                              .font(.headline)
                              .foregroundColor(.gray)

                          Text(code)
                              .font(.title3)
                              .fontWeight(.bold)
                              .foregroundColor(.blue)
                              .padding()
                              .background(Color.gray.opacity(0.2))
                              .cornerRadius(10)
                              .frame(maxWidth: 300)
                              .multilineTextAlignment(.center)
                              .onAppear {
                                  viewModel.saveScannedCode(code)
                              }
                      }

                      NavigationLink("Ver QR guardados", destination: ListaView())
                          .font(.headline)
                          .padding()
                          .background(Color.blue)
                          .foregroundColor(.white)
                          .cornerRadius(10)
                  } else if viewModel.showPinInput {
                      VStack {
                          Text("Ingrese su PIN")
                              .font(.headline)

                          SecureField("PIN", text: $viewModel.enteredPin)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                              .keyboardType(.numberPad)
                              .padding()

                          if let error = viewModel.errorMessage {
                              Text(error)
                                  .foregroundColor(.red)
                                  .font(.caption)
                          }

                          Button("Validar PIN") {
                              viewModel.validatePIN()
                          }
                          .font(.headline)
                          .padding()
                          .background(Color.green)
                          .foregroundColor(.white)
                          .cornerRadius(10)
                      }
                  } else {
                      Text("Autenticación requerida")
                          .font(.headline)

                      Button("Autenticar") {
                          viewModel.authenticate()
                      }
                      .font(.headline)
                      .padding()
                      .background(Color.green)
                      .foregroundColor(.white)
                      .cornerRadius(10)
                  }
              }
              .padding()
          }
      }
}


