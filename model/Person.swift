//
//  Person.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import Foundation
import SwiftUI

class Person: Codable, ObservableObject {
    var name: String
    var points: Int
    var vanDong: [BaiTapTre] = BaiTapTre.macDinh
    var avatar: MucTap

    init(name: String, vandong: [BaiTapTre], points: Int = 0, avatar: MucTap) {
        self.name = name
        self.vanDong = vandong
        self.points = points
        self.avatar = avatar
    }

    enum CodingKeys: String, CodingKey {
        case name, points, vanDong, avatar
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        points = try container.decode(Int.self, forKey: .points)
        avatar = try container.decode(MucTap.self, forKey: .avatar)
        vanDong = (try? container.decode([BaiTapTre].self, forKey: .vanDong)) ?? BaiTapTre.macDinh
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(avatar, forKey: .avatar)
        try container.encode(vanDong, forKey: .vanDong)
    }
}



enum MucTap: String, CaseIterable, Identifiable, Codable {
    case chay = "figure.run"
    case cardio = "figure.mixed.cardio"
    case bong = "figure.basketball"
    case gian = "figure.strengthtraining.functional"
    case martial = "figure.highintensity.intervaltraining"
    case squats = "figure.cross.training"
    case plank = "figure.wrestling"
    case boxing = "figure.boxing"
    
    var id: String { self.rawValue}
    var name: String {
        switch self {
        case .chay:
            return "Run"
        case .cardio:
            return "Cardio"
        case .bong:
            return "BasketBall"
        case .gian:
            return "Strength"
        case .martial:
            return "Highintensity"
        case .plank:
            return "Plank"
        case .boxing:
            return "Punching"
        case .squats:
            return "Squats"
        }
    }
    
    var hinh: String {
        switch self {
        case .chay:
            return "tornado"
        case .cardio:
            return "snowflake"
        case .bong:
            return "bolt"
        case .gian:
            return "hare.fill"
        case .martial:
            return "pawprint.fill"
        case .plank:
            return "bird.fill"
        case .boxing:
            return "ladybug.fill"
        case .squats:
            return "fish.fill"
        }
    }
    
    var mau: Color {
        switch self {
        case .chay:
            return .brown
        case .cardio:
            return .cyan
        case .bong:
            return .yellow
        case .gian:
            return .indigo
        case .martial:
            return .green
        case .plank:
            return .mint
        case .boxing:
            return .orange
        case .squats:
            return .pink
        }
    }
}

extension Person {
    static var mauPerson: Person = Person(name: "Hibi", vandong: BaiTapTre.macDinh, avatar: .bong)
    static var mucTap: [MucTap] = [.chay, .cardio, .bong, .gian, .martial, .squats, .plank, .boxing]
}
enum LoiDiem: String, Error {
    case quaNhieuDiem = "Not enough points"
}
