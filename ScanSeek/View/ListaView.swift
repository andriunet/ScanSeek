//
//  ListaView.swift
//  ScanSeek
//
//  Created by Andres Marin on 28/02/25.
//

import SwiftUI

struct ListaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: ScannedCode.entity(),
        sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]
    ) private var savedCodes: FetchedResults<ScannedCode>

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        List {
            ForEach(savedCodes) { code in
                VStack(alignment: .leading) {
                    Text(code.value ?? "Desconocido")
                        .font(.headline)
                    if let date = code.date {
                        Text("Escaneado el: \(date, formatter: dateFormatter)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Códigos Guardados")
    }
}
