//
//  BaiTapTre.swift
//  IDo
//
//  Kid exercise definitions with image/video demos and workout instructions.
//

import Foundation
import SwiftUI

enum ExerciseMediaKind {
    case image
    case video
}

enum LoaiBaiTap: Codable, Equatable {
    case thoiGian(soSet: Int, giayMoiSet: [Int])
    case lap(soLan: Int)
}

enum BaiTapTre: String, CaseIterable, Identifiable, Codable {
    case plank
    case jog
    case situp
    case thighLift
    case legLift

    var id: String { rawValue }

    var name: String {
        switch self {
        case .plank: return "Plank"
        case .jog: return "Jog in Place"
        case .situp: return "Sit-ups"
        case .thighLift: return "Thigh Lifts"
        case .legLift: return "Leg Lifts"
        }
    }

    var huongDan: String {
        switch self {
        case .plank:
            return "Hands on the ground, arms straight and shoulder-width apart, body and legs in a straight line forming a 30-degree angle. Hold for 1 minute × 4 sets, reducing 5 seconds each set."
        case .jog:
            return "Jog in place for 1 minute × 4 sets."
        case .situp:
            return "Lie flat on your back, keep your legs in position, and perform sit-ups 15 times."
        case .thighLift:
            return "Sit with your back straight, legs together, and lift both thighs up to belly height 15 times."
        case .legLift:
            return "Sit leaning back with hands supporting behind you. Keep legs straight and together, then lift them up to belly height 15 times."
        }
    }

    var mediaFileName: String {
        switch self {
        case .plank: return "flankKid"
        case .jog: return "joginplace"
        case .situp: return "situp"
        case .thighLift: return "thighsUp"
        case .legLift: return "longlegsLiftUp"
        }
    }

    var mediaKind: ExerciseMediaKind {
        switch self {
        case .plank: return .image
        case .jog, .situp, .thighLift, .legLift: return .video
        }
    }

    var mediaExtension: String {
        mediaKind == .image ? "jpg" : "mp4"
    }

    var loai: LoaiBaiTap {
        switch self {
        case .plank:
            return .thoiGian(soSet: 4, giayMoiSet: [60, 55, 50, 45])
        case .jog:
            return .thoiGian(soSet: 4, giayMoiSet: [60, 60, 60, 60])
        case .situp, .thighLift, .legLift:
            return .lap(soLan: 15)
        }
    }

    var mau: Color {
        switch self {
        case .plank: return .mint
        case .jog: return .orange
        case .situp: return .cyan
        case .thighLift: return .indigo
        case .legLift: return .green
        }
    }
}

extension BaiTapTre {
    static var macDinh: [BaiTapTre] = [.plank, .jog, .situp, .thighLift, .legLift]
}