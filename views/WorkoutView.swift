//
//  WorkoutView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI


struct WorkOutView: View {
    @Binding var person: Person
    @State private var xemBaiTap: MucTap?
    @State private var tapXong = false
    
    var body: some View {
        TabView(selection: $xemBaiTap){
            
            Group {
                ForEach(person.vanDong) { mon in
                    VStack {
                        BaiTap(ten: person.name, baiTap: mon)
                            .tag(MucTap.chay)
                            .padding(50)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .onAppear {
                person.points += 1
            }
    }//body
    
    
}

struct WorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutView(person: .constant(.mauPerson))
    }
}
