//
//  ChonAvatarView.swift
//  IDo
//
//  Created by Jubi on 8/29/23.
//

import SwiftUI

struct ChonAvatarView: View {
    @Binding var person: Person
    var avatars: [MucTap] = Person.mucTap
    var columns: [GridItem] = [GridItem(spacing:25, alignment: .center),
                             GridItem(spacing:25, alignment: .center),
                             GridItem(spacing:25, alignment: .center)]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns,alignment: .center,spacing: 20){
                    ForEach(avatars){ avatar in
                        Button(action: {
                            person.avatar = avatar
                            dismiss()
                        }, label: {
                            Image(systemName: avatar.hinh)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(avatar.mau)
                        })
                    }
                }
            }
        }
    }//body
    private func addAvatar(){
        
    }
}

struct ChonAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ChonAvatarView(person: .constant(.mauPerson))
    }
}
