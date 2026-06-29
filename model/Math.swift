//
//  Math.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import Foundation
import SwiftUI

struct Math: Codable {
    var x: Int
    var y: Int
    var mau: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    
    static let loatHinh = [
            Hinh(name: "tshirt"),
            Hinh(name: "eyes"),
            Hinh(name: "eyebrow"),
            Hinh(name: "nose"),
            Hinh(name: "mustache"),
            Hinh(name: "mouth"),
            Hinh(name: "eyeglasses"),
            Hinh(name: "facemask"),
            Hinh(name: "brain.head.profile"),
            Hinh(name: "brain"),
            Hinh(name: "icloud"),
            Hinh(name: "theatermasks.fill"),
            Hinh(name: "house.fill"),
            Hinh(name: "sun.max.fill"),
            Hinh(name: "cloud.rain.fill"),
            Hinh(name: "pawprint.fill"),
            Hinh(name: "lungs.fill"),
            Hinh(name: "face.smiling"),
            Hinh(name: "gear"),
            Hinh(name: "allergens"),
            Hinh(name: "bolt.heart"),
            Hinh(name: "ladybug.fill"),
            Hinh(name: "bus.fill"),
            Hinh(name: "bicycle.circle"),
            Hinh(name: "faceid"),
            Hinh(name: "gamecontroller.fill"),
            Hinh(name: "timer"),
            Hinh(name: "eye.fill"),
            Hinh(name: "person.icloud"),
            Hinh(name: "tortoise.fill"),
            Hinh(name: "hare.fill"),
            Hinh(name: "leaf.fill"),
            Hinh(name: "wand.and.stars"),
            Hinh(name:"globe.americas.fill"),
            Hinh(name: "globe.europe.africa.fill"),
            Hinh(name: "globe.asia.australia.fill"),
            Hinh(name: "hands.sparkles.fill"),
            Hinh(name: "hand.draw.fill"),
            Hinh(name: "waveform.path.ecg.rectangle.fill"),
            Hinh(name: "gyroscope"),
            
        ]
}

let hinhThienNhien = [
        Hinh(name: "globe.americas"),
        Hinh(name: "sun.max"),
        Hinh(name: "sunrise.fill"),
        Hinh(name: "sun.haze.fill"),
        Hinh(name: "sun.snow.fill"),
        Hinh(name: "moon.fill"),
        Hinh(name: "fossil.shell"),
        Hinh(name: "atom"),
        Hinh(name: "carrot"),
        Hinh(name: "tree"),
        Hinh(name: "camera.macro"),
        Hinh(name: "leaf"),
        Hinh(name: "ant.fill"),
        Hinh(name: "bird.fill"),
        Hinh(name: "cloud.rain.fill"),
        Hinh(name: "pawprint.fill"),
        Hinh(name: "lizard.fill"),
        Hinh(name: "cat.fill"),
        Hinh(name: "dog.fill"),
        Hinh(name: "mountain.2.fill"),
        Hinh(name: "thermometer.snowflake"),
        Hinh(name: "tornado"),
        Hinh(name: "wind.snow"),
        Hinh(name: "cloud.bolt.fill"),
        Hinh(name: "cloud.snow.fill"),
        Hinh(name: "cloud.rain.fill"),
        Hinh(name: "cloud.fill"),
        Hinh(name: "lightbulb.max"),
        Hinh(name: "house"),
        Hinh(name: "fingure.walk.motion"),
        Hinh(name: "fan.floor"),
        Hinh(name: "fan.ceiling"),
        Hinh(name: "lamp.desk"),
        Hinh(name: "spigot"),
        Hinh(name: "shower"),
        Hinh(name: "balloon"),
        Hinh(name: "popcorn"),
        Hinh(name: "alarm"),
        Hinh(name: "compass.drawing"),
        
    ]
