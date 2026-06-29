//
//  SubtractionView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct SubtractionView: View {
    @State private var math: Math = Math(x: Int.random(in: 73...730),
                                         y: Int.random(in: 42...420))
    var result: Int {
        return soTru() - math.y
    }
    @State private var userInPut = ""
    @State private var check = false
    @FocusState private var dienO: ConTro?
    enum ConTro: Hashable {
        case nhap
    }
    var body: some View {
        VStack {
            Image(systemName: "hand.point.right")
                .opacity(check ? 1 : 0)
                .font(.system(size: 70))
                .foregroundColor(math.mau)
            VStack(alignment: .trailing) {
                Text("\(soTru())")
                Label("  ", systemImage: "minus")
                Text("\(math.y)")
                GachNgang()
                TextField("x?", text: $userInPut)
                    .keyboardType(.numbersAndPunctuation)
                    .fixedSize(horizontal: true, vertical: true)
                    .focused($dienO, equals: .nhap)
                Button(action: {
                    kiemtra()
                }, label: {
                    Image(systemName: check ? "brain.head.profile" : "questionmark")
                        .foregroundColor(check ? .green : .gray)
                })
            }
            .padding(15)
            .font(.system(size: 60))
        }
        
        
    }//body
    private func kiemtra(){
        if Int(userInPut) == result {
            check = true
        } else {check = false }
    }
    
    private func soTru() -> Int {
        if math.x < math.y {
            return math.y
        } else {
            return math.x
        }
    }

}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
