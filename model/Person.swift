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
    var vanDong: [MucTap] = [MucTap.chay]
    var avatar: MucTap
    
    init(name: String, vandong: [MucTap], points: Int = 0, avatar: MucTap) {
        self.name = name
        self.vanDong = vandong
        self.points = points
        self.avatar = avatar
    }
    static var mauPerson: Person = Person(name: "Hibi", vandong: mucTap, avatar: .bong)
    static var mucTap: [MucTap] = [.chay, .cardio, .bong, .gian, .martial, .squats, .plank, .boxing]
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
            return .red
        case .squats:
            return .pink
        }
    }
}
