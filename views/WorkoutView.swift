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
//    @State private var layTen = false
    @State private var thoigianTap: Double = 1
//    @State private var name = ""
    var step: Double = 1.0
    var body: some View {
        NavigationStack {
            TabView(selection: $xemBaiTap){
                Group {
                    ForEach(person.vanDong) { mon in
                        VStack {
                            BaiTap(person: $person, baiTap: mon, thoigiantap: thoigianTap)
                                .tag(MucTap.chay)
                                .padding(50)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            
            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading){
//                    Button(action: {layTen = true}, label: {
//                        Image(systemName: person.name.isEmpty ? "person.fill.badge.plus" : person.avatar.hinh)
//                            .foregroundStyle(person.name.isEmpty ? .black : person.avatar.mau)
//                    })
//                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Stepper(value: $thoigianTap,in: 1...5, step: step){
                        Text("Time")
                        Text("\(thoigianTap.description)s")
                    }
                }
            }
//            .alert("Name, Please", isPresented: $layTen, actions: {
//                TextField("Your Name", text: $name)
//                Button("Done", action: {
//                    person.name = name
//                })
//            })
        }
    }//body
    
    
}

struct WorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutView(person: .constant(.mauPerson))
    }
}


    
