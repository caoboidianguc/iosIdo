//
//  MathView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct MathView: View {
    @Binding var person: Person
    @State private var chon: ChonPhepTinh?
    @State private var bonus = false
    
    var body: some View {
        HStack {
            TabView(selection: $chon){
                Group {
                    ForEach(0..<2){ _ in
                        AdditionView()
                            .tag(ChonPhepTinh.cong)
                        SubtractionView()
                            .tag(ChonPhepTinh.tru)
                        MultiplyView()
                            .tag(ChonPhepTinh.nhan)
                        DivideView()
                            .tag(ChonPhepTinh.chia)
                    }
                    LastView(person: $person)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
        }
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView(person: .constant(.mauPerson))
    }
}


enum ChonPhepTinh {
    case cong
    case tru
    case nhan
    case chia
    
    var dangChon: Bool {
        switch self {
        case .cong:
            return true
        case .chia:
            return true
        case .nhan:
            return true
        case .tru:
            return true
        }
    }
}
