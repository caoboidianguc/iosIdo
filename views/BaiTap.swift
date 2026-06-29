//
//  BaiTap.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//
import AVFoundation
import SwiftUI

struct BaiTap: View {
    @State private var nutbam = false
    var person: Person
    var baiTap: BaiTapTre = .plank
    var isCurrentPage: Bool = true
    var color: [Color] = [.green, .accentColor, .cyan, .indigo, .mint, .orange, .red, .yellow]
    @State private var thoigian: ClosedRange<Date> = Date()...Date().addingTimeInterval(0)
    @State private var setHienTai = 1
    @State private var soLan = 0
    @State private var phutChon = 1
    @State private var giayChon = 0
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }

    private var tongSoSet: Int {
        if case .thoiGian(let soSet, _) = baiTap.loai { return soSet }
        return 1
    }

    private var giayMacDinh: Int {
        if case .thoiGian(_, let giayMoiSet) = baiTap.loai {
            return giayMoiSet.first ?? 60
        }
        return 60
    }

    private var tongGiayChon: Int {
        let total = phutChon * 60 + giayChon
        return total > 0 ? total : 5
    }

    private var giayToiDa: Int {
        phutChon == 10 ? 0 : 59
    }

    private var giaySetHienTai: Int {
        giayChoSet(setHienTai)
    }

    private var mucTieuLan: Int {
        if case .lap(let soLan) = baiTap.loai { return soLan }
        return 15
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(person.name)
                .font(.system(size: 48, weight: .light, design: .monospaced))
                .foregroundColor(baiTap.mau)

            HinhBaiTapView(baiTap: baiTap, isActive: nutbam && isCurrentPage)

            Text(baiTap.name)
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(baiTap.mau)

            Text(baiTap.huongDan)
                .font(.system(size: 42, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .foregroundColor(.primary)
                .padding(.horizontal, 16)
                .minimumScaleFactor(0.85)

            Spacer()

            workoutControl
        }
        .padding(.vertical)
        .onChange(of: isCurrentPage) { _, visible in
            if !visible {
                dungBaiTap()
            }
        }
        .onAppear {
            datThoiGianMacDinh()
        }
    }

    @ViewBuilder
    private var workoutControl: some View {
        switch baiTap.loai {
        case .thoiGian:
            VStack(spacing: 12) {
                chonThoiGian
                Text("Set \(setHienTai) of \(tongSoSet)")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                Text(hienThiThoiGian(giaySetHienTai))
                    .font(.system(size: 34, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                Button(action: toggleTimedWorkout) {
                    demThoiGian(time: thoigian)
                }
            }
        case .lap:
            VStack(spacing: 12) {
                Text("\(soLan) / \(mucTieuLan)")
                    .font(.system(size: 72, weight: .bold, design: .rounded))
                    .foregroundColor(baiTap.mau)
                Button(action: toggleRepWorkout) {
                    Label(
                        nutbam ? "Tap each rep" : "Start Workout",
                        systemImage: nutbam ? "plus.circle.fill" : "play.fill"
                    )
                    .font(.system(size: 40, weight: .semibold))
                    .padding(15)
                }
            }
        }
    }

    func demThoiGian(time: ClosedRange<Date>) -> some View {
        ProgressView(timerInterval: time) {
            Label(nutbam ? "Stop" : "Start Workout", systemImage: nutbam ? "stop.circle.fill" : "play.fill")
        }
        .padding(15)
        .font(.system(size: 40, weight: .semibold))
    }

    private var chonThoiGian: some View {
        VStack(spacing: 8) {
            Text("Workout Time")
                .font(.system(size: 32, weight: .semibold, design: .rounded))

            HStack(spacing: 4) {
                Picker("Minutes", selection: $phutChon) {
                    ForEach(0...10, id: \.self) { phut in
                        Text("\(phut)")
                            .font(.system(size: 36, weight: .semibold, design: .rounded))
                            .tag(phut)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100, height: 140)
                .clipped()

                Text(":")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .padding(.bottom, 8)

                Picker("Seconds", selection: $giayChon) {
                    ForEach(0...giayToiDa, id: \.self) { giay in
                        Text(String(format: "%02d", giay))
                            .font(.system(size: 36, weight: .semibold, design: .monospaced))
                            .tag(giay)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100, height: 140)
                .clipped()
            }

            Text("min : sec")
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
        }
        .disabled(nutbam)
        .opacity(nutbam ? 0.5 : 1)
        .onChange(of: phutChon) { _, phut in
            if phut == 10 {
                giayChon = 0
            }
        }
    }
}

extension BaiTap {
    private func datThoiGianMacDinh() {
        let macDinh = min(giayMacDinh, 600)
        phutChon = macDinh / 60
        giayChon = macDinh % 60
    }

    private func giayChoSet(_ set: Int) -> Int {
        switch baiTap {
        case .plank:
            return max(tongGiayChon - (set - 1) * 5, 5)
        default:
            return tongGiayChon
        }
    }

    private func hienThiThoiGian(_ seconds: Int) -> String {
        let phut = seconds / 60
        let giay = seconds % 60
        if phut > 0 && giay > 0 {
            return "\(phut) min \(giay) sec"
        }
        if phut > 0 {
            return "\(phut) min"
        }
        return "\(giay) sec"
    }

    private func dungBaiTap() {
        nutbam = false
        resetTimedWorkout()
        soLan = 0
        player.isMuted = true
    }

    private func toggleTimedWorkout() {
        nutbam.toggle()
        if nutbam {
            batDauSet()
            Task { await choiNhacTheoThoiGian() }
        } else {
            dungBaiTap()
        }
    }

    private func toggleRepWorkout() {
        if !nutbam {
            nutbam = true
            soLan = 0
        } else {
            soLan += 1
            if soLan >= mucTieuLan {
                Task {
                    await player.seek(to: .zero)
                    player.play()
                }
                nutbam = false
                soLan = 0
            }
        }
    }

    private func batDauSet() {
        thoigian = Date()...Date().addingTimeInterval(Double(giaySetHienTai))
    }

    private func resetTimedWorkout() {
        thoigian = Date()...Date().addingTimeInterval(0)
        setHienTai = 1
    }

    func choiNhacTheoThoiGian() async {
        let giay = Double(giaySetHienTai)
        do {
            try await Task.sleep(for: .seconds(giay))
            guard nutbam, isCurrentPage else { return }

            await player.seek(to: .zero)
            player.play()

            if setHienTai < tongSoSet {
                setHienTai += 1
                batDauSet()
                await choiNhacTheoThoiGian()
            } else {
                nutbam = false
                resetTimedWorkout()
            }
        } catch {
            resetTimedWorkout()
            nutbam = false
        }
    }
}

struct BaiTap_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap(person: .mauPerson, baiTap: .plank)
    }
}