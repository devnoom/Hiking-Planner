//
//  HikingSpot.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//


import Foundation

struct HikingSpot: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
    let rating: Double
    let level: DifficultyLevel
    let mode: ModeOfTransportation
}

enum DifficultyLevel: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"

    var id: String { self.rawValue }
}

enum ModeOfTransportation: String, CaseIterable, Identifiable {
    case walking = "Walking"
    case biking = "Biking"

    var id: String { self.rawValue }
}




import Foundation

struct HikingSampleData {
    static let hikingSpots: [HikingSpot] = [
        HikingSpot(name: "Mountain Trail", description: "A beautiful mountain trail.", image: "https://example.com/mountain.jpg", rating: 4.7, level: .hard, mode: .walking),
        HikingSpot(name: "Forest Walk", description: "A peaceful walk through the forest.", image: "https://example.com/forest.jpg", rating: 4.3, level: .medium, mode: .biking),
        HikingSpot(name: "Lakeside Path", description: "A serene path by the lake.", image: "https://example.com/lake.jpg", rating: 4.5, level: .easy, mode: .walking),
        HikingSpot(name: "Desert Trek", description: "An adventurous trek through the desert.", image: "https://example.com/desert.jpg", rating: 4.2, level: .hard, mode: .biking),
        HikingSpot(name: "Beachside Trail", description: "A refreshing walk by the beach.", image: "https://example.com/beach.jpg", rating: 4.8, level: .easy, mode: .walking),
        HikingSpot(name: "Hilltop Hike", description: "A challenging hike to the hilltop.", image: "https://example.com/hill.jpg", rating: 4.6, level: .medium, mode: .biking)
    ]
}
