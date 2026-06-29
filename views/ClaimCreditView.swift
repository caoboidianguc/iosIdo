//
//  ClaimCreditView.swift
//  IDo
//
//  Created by Jubi on 10/1/23.
//

import SwiftUI

struct ClaimCreditView: View {
    @Binding var person: Person
    @Environment(\.dismiss) private var dismiss
    @State private var pointsClaim: Int = 0
    var body: some View {

        Form {
            TextField("Enter credit", value: $pointsClaim, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding()
        }
        .frame(idealWidth: 400, idealHeight: 300)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Dismiss", action: {dismiss()})
            })
            ToolbarItem(placement: .topBarTrailing, content: {
                Button("Done", action: {
                    Task {
                        try layDiem()
                        
                    }
                })
            })
        })
        
    }//body
   
    func layDiem() throws {
        guard pointsClaim <= person.points else {
            throw LoiDiem.quaNhieuDiem
        }
        person.points -= pointsClaim
        dismiss()
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    ClaimCreditView(person: .constant(.mauPerson))
}
