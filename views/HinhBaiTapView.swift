//
//  HinhBaiTapView.swift
//  IDo
//
//  Created by Jubi on 10/3/23.
//

import SwiftUI

struct HinhBaiTapView: View {
    var baiTap: BaiTapTre
    var isActive: Bool

    var body: some View {
        ExerciseMediaView(baiTap: baiTap, isActive: isActive)
    }
}

#Preview {
    HinhBaiTapView(baiTap: .plank, isActive: true)
}