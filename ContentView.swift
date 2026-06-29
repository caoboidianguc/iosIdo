//
//  ContentView.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @Bindable var person: PersonStore
    @State private var chon: ChonView = .profile
    @Environment(\.scenePhase) private var scenePhase
    let luu: () -> Void
    var body: some View {
        TabView(selection: $chon) {
            WorkOutView(person: $person.person)
                .tabItem {
                    Label("Workout", systemImage: "trophy.fill")
                }
                .tag(ChonView.workout)
            
            MathView(person: $person.person)
                .tabItem {
                    Label("Math", systemImage: "function")
                }
                .tag(ChonView.math)
            
            Profile(person: $person.person)
                .tabItem{
                    Label("About", systemImage: "person")
                }
                .tag(ChonView.profile)
        }
        .onChange(of: scenePhase){
            if scenePhase == .inactive {
                luu()
            }
        }
        
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(person: PersonStore(), luu: {})
    }
}

enum ChonView {
    case workout
    case math
    case profile
}
