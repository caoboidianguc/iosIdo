//
//  TinhThoiGian.swift
//  IDo
//
//  Created by Jubi on 9/27/23.
//

import SwiftUI

struct TinhThoiGian: View {
    @State private var nutBam: Bool = false
    @State var thoigianChay = 60
    
    //don't change
    @State private var batdau = 0.0
    var vongCung: Int = 60
    var nutPlay: String {nutBam ? "Stop" : "Start Workout"}
    
    var body: some View {
        ZStack {
            ThoiGian(batdauVong: batdau, ketthucVong: vongCung)
                .rotation(Angle(degrees: -90))
                .stroke(Gradient(colors: [.red, .blue, .yellow, .green]), style: StrokeStyle(lineWidth: 42, lineCap: .round))
                
        }
        Button(nutPlay, action: {
            nutBam.toggle()
            Task{
                await thoigianQua()
            }
        })
        
    }
    
    func thoigianQua() async {
        if nutBam == false || thoigianChay == 0 {
            batdau = 0.0
            return
        }
        
        try? await Task.sleep(for: .seconds(1))
        batdau += Double(360/vongCung)
        thoigianChay -= 1
         await thoigianQua()
        
    }
    
}

#Preview {
    TinhThoiGian()
}



    struct ThoiGian: Shape {
        let batdauVong: Double
        let ketthucVong: Int
        
        private var phanCungChay: Double {
            360 / Double(ketthucVong)
        }
        var batDauCung: Angle {
            Angle(degrees: batdauVong)
        }
        var cuoiVong: Angle{
            Angle(degrees: batDauCung.degrees + phanCungChay)
        }
        
        func path(in rec: CGRect) -> Path {
            let diameter = min(rec.size.width, rec.size.height) - 24.0
            let radius = diameter / 2.0
            let center = CGPoint(x: rec.midX, y: rec.midY)
            
            var path = Path()
            
            path.addArc(center: center, radius: radius, startAngle: batDauCung, endAngle: cuoiVong, clockwise: false)
            return path
            }
        
        
    }


 
