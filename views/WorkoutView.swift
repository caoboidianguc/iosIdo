//
//  WorkoutView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct WorkOutView: View {
    @Binding var person: Person
    @State private var xemBaiTap: BaiTapTre?

    var body: some View {
        NavigationStack {
            TabView(selection: $xemBaiTap) {
                ForEach(person.vanDong) { mon in
                    BaiTap(person: person, baiTap: mon, isCurrentPage: xemBaiTap == mon)
                        .tag(mon as BaiTapTre?)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .onAppear {
                person.points += 1
                if xemBaiTap == nil {
                    xemBaiTap = person.vanDong.first
                }
            }
        }
    }
}

struct WorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutView(person: .constant(.mauPerson))
    }
}