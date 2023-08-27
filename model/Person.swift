//
//  Person.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import Foundation


class Person: Codable, ObservableObject {
    var name: String
    var points: Int
    var vanDong: [MucTap] = [MucTap.chay]
    
    init(name: String, vandong: [MucTap], points: Int = 0 ) {
        self.name = name
        self.vanDong = vandong
        self.points = points
    }
    static var mauPerson: Person = Person(name: "Hibi", vandong: mucTap)
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
}
