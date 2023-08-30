//
//  LastView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct LastView: View {
    @Binding var person: Person
    @State private var diem = false
    @State private var math: Math = Math(x: Int.random(in: 1...59),
                                         y: Int.random(in: 10...51))
    var result: Int {
        return math.x + math.y
    }
    @State private var userInPut = ""
    @State private var check = false
    
    var body: some View {
        VStack {
            Button(action: {
                diem = true
            }, label: {
                ZStack{
                    Ellipse()
                        .frame(width: 120, height: 70)
                    Text("Bonus")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                }
            }).opacity(diem ? 0 : 1)
                VStack(alignment: .trailing) {
                    Text("\(math.x)")
                    Label("  ", systemImage: "plus")
                    Text("\(math.y)")
                    GachNgang()
                    TextField("x?", text: $userInPut)
                        .keyboardType(.numbersAndPunctuation)
                        .fixedSize(horizontal: true, vertical: true)
                    Button(action: {
                        kiemtra()
                    }, label: {
                        Image(systemName: check ? "brain.head.profile" : "questionmark")
                            .foregroundColor(check ? .green : .gray)
                    })
                }
                .padding(15)
                .font(.system(size: 50))
                .opacity(diem ? 1 : 0)
            
        }
        
    }//body
    private func kiemtra(){
        if Int(userInPut) == result {
            check = true
            person.points += 1
        } else {check = false }
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView(person: .constant(.mauPerson))
    }
}



