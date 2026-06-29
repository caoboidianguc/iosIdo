//
//  MultiplyView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct MultiplyView: View {
    @State private var math: Math = Math(x: Int.random(in: 2...10),
                                         y: Int.random(in: 2...11))
    var result: Int {
        return math.x * math.y
    }
    @State private var userInPut = ""
    @State private var check = false
    @FocusState private var dienO: ConTro?
    enum ConTro: Hashable {
        case nhap
    }
//    var index: Int = Int.random(in: 0...Math.loatHinh.count)
    var body: some View {
//        VStack{
//            HStack{
//                ForEach(0..<math.x, id:\.self){ _ in
//                    HinhMinhHoa(name: Math.loatHinh[index].name)
//                }
//            }
            VStack{
                Image(systemName: "hand.point.right")
                    .opacity(check ? 1 : 0)
                    .font(.system(size: 70))
                    .foregroundColor(math.mau)
                VStack(alignment: .trailing) {
                    Text("\(math.x)")
                    Label("  ", systemImage: "multiply")
                    Text("\(math.y)")
                    GachNgang()
                    TextField("x?", text: $userInPut)
                        .focused($dienO, equals: .nhap)
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
//        }
        
        
    }//body
    private func kiemtra(){
        if Int(userInPut) == result {
            check = true
        } else {check = false }
    }
    
}

struct MultiplyView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyView()
    }
}
