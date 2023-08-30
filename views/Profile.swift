//
//  Profile.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct Profile: View {
    @Binding var person: Person
    @State private var chonAvatar = false
    @State private var layTen = false
    @State private var name = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        chonAvatar = true
                    }, label: {
                        Image(systemName: person.avatar.hinh)
                            .font(.system(size: 100))
                    })
                    Text(person.name)
                        .font(.system(size: 50))
                }
                .foregroundColor(person.avatar.mau)
                
                if person.points > 0 {
                    Text("You gain \(person.points) credit from\nMath and workout")
                        .font(.system(.title))
                }else{
                    Text("You can earn points from \nFun Math or exercises")
                        .font(.system(.title))
                }
            }
            
            .alert("Name, Please", isPresented: $layTen, actions: {
                TextField("Your Name", text: $name)
                Button("Done", action: {
                    person.name = name
                })
            })
            .sheet(isPresented: $chonAvatar){
                NavigationStack {
                    ChonAvatarView(person: $person)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {layTen = true}, label: {
                        Image(systemName: person.name.isEmpty ? "person.fill.badge.plus" : person.avatar.hinh)
                            .foregroundStyle(person.name.isEmpty ? .black : person.avatar.mau)
                    })
                }
            }
        }
    }//body
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(person: .constant(.mauPerson))
    }
}
