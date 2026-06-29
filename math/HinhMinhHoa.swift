//
//  HinhMinhHoa.swift
//  IDo
//
//  Created by Jubi on 10/2/23.
//

import SwiftUI

struct HinhMinhHoa: View {
    
    var name: String
    var body: some View {
        Image(systemName: name)
            .resizable()
            .frame(minWidth: 15, idealWidth: 42, maxWidth: 73,
                   minHeight: 15, idealHeight: 42, maxHeight: 73, alignment: .center)
            .foregroundStyle(.cyan)
    }
    
   
    
   
}

#Preview {
    HinhMinhHoa(name: "globe")
}
