//
//  NewPerson.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import SwiftUI

struct NewPerson: View {
    @State private var name = ""
    @Binding var person: Person
    
    var body: some View {
        TextField("Your Name", text: $name)
    }//body
    
}

struct NewPerson_Previews: PreviewProvider {
    static var previews: some View {
        NewPerson(person: .constant(.mauPerson))
    }
}


