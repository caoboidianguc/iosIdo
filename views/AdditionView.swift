//
//  AdditionView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct AdditionView: View {
    @State private var math: Math = Math(x: Int.random(in: 1...59),
                                         y: Int.random(in: 10...51))
    var result: Int {
        return math.x + math.y
    }
    @State private var userInPut = ""
    @State private var check = false
    
    var body: some View {
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
                Image(systemName: check ? "checkmark" : "questionmark")
            })
        }
        .padding(15)
        .font(.system(size: 50))
        
        
    }//body
    private func kiemtra(){
        if Int(userInPut) == result {
            check = true
        } else {check = false }
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}

struct GachNgang: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 2)
    }
}
