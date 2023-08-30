//
//  ContentView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var person: Person
    @State private var chon: ChonView?
    @Environment(\.scenePhase) private var scenePhase
    let luu: () -> Void
    var body: some View {
        TabView {
            WorkOutView(person: $person)
                .tabItem {
                    Label("Workout", systemImage: "trophy.fill")
                }
            
            MathView(person: $person)
                .tabItem {
                    Label("Math", systemImage: "function")
                }
            
            Profile(person: $person)
                .tabItem{
                    Label("About", systemImage: "person")
                }
        }
        .onChange(of: scenePhase){ pha in
            if pha == .inactive {
                luu()
            }
        }
        
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(person: .constant(.mauPerson), luu: {})
    }
}

enum ChonView {
    case workout
    case math
}
