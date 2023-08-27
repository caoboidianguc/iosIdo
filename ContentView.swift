//
//  ContentView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var person: Person = Person(name: "Hibi", vandong: Person.mucTap)
    @State private var chon: ChonView?
    
    var body: some View {
        TabView {
            WorkOutView(person: $person)
                .tabItem {
                    Label("Workout", systemImage: "trophy.fill")
                }
            
            SubtractionView()
                .tabItem {
                    Label("Math", systemImage: "function")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum ChonView {
    case workout
    case math
}
