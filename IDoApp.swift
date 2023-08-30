//
//  IDoApp.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

@main
struct IDoApp: App {
    @StateObject var person = PersonStore()
    var body: some Scene {
        WindowGroup {
            ContentView(person: $person.person){
                
                Task {
                    do{
                        try await person.save(person: person.person)
                    }catch {
                        fatalError("Chua the luu profile")
                    }
                }
            }
            .task {
                do {
                    try await person.load()
                } catch {
                    fatalError("khong the load profile")
                }
            }
        }
    }
}
