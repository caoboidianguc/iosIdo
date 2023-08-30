//
//  BaiTap.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct BaiTap: View {
    @State private var nutbam = false
    @Binding var person: Person
    var baiTap: MucTap = .chay
    var color: [Color] = [.green, .accentColor, .cyan, .indigo, .mint, .orange, .red, .yellow]
    @State private var thoigian: ClosedRange<Date> = Date()...Date().addingTimeInterval(0)
    var thoigiantap: Double = 1
    
    var body: some View {
        VStack {
            Text(person.name)
                .font(.system(size: 75, weight: .light, design: .monospaced))
                .foregroundColor(color.randomElement())
            Image(systemName: baiTap.rawValue)
                .resizable()
                .scaledToFit()
//                .frame(width: 400)
                .symbolRenderingMode(.hierarchical)
       
            Spacer()
        
            Text(baiTap.name)
                .font(.system(size: 75, weight: .semibold, design: .rounded))
            Button(action: {
                nutbam.toggle()
                thoigian = Date()...Date().addingTimeInterval(thoigiantap*60)
                if nutbam == true {
                    person.points += 1
                }
            }, label: {
                demThoiGian(time: thoigian)
            })
        }
        .foregroundColor(color.randomElement())
        
    }//body
    func demThoiGian(time: ClosedRange<Date>) -> some View {
        ProgressView(timerInterval: time){
            Label(nutbam ? "Stop" : "Start Workout", systemImage: nutbam ? "stop.circle.fill" : "play.fill")
        }.padding(15)
            .font(.system(size: 40))
    }
}

struct BaiTap_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap(person: .constant(.mauPerson), baiTap: MucTap.chay)
    }
}
