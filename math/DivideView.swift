//
//  DivideView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct DivideView: View {
    @State private var math: Math = Math(x: Int.random(in: 2...10),
                                         y: Int.random(in: 2...11))
    var result: Int {
        return math.x * math.y
    }
    @State private var userInPut = ""
    @State private var check = false
    
    
    var body: some View {
        VStack{
            Image(systemName: "hand.point.right")
                .opacity(check ? 1 : 0)
                .font(.system(size: 70))
                .foregroundColor(math.mau.randomElement())
            VStack(alignment: .trailing) {
                Text("\(result)")
                Label("  ", systemImage: "divide")
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
            .font(.system(size: 60))
        }
        
        
    }//body
    private func kiemtra(){
        if Int(userInPut) == math.x {
            check = true
        } else {check = false }
    }
   
}

struct DivideView_Previews: PreviewProvider {
    static var previews: some View {
        DivideView()
    }
}
