//
//  HikingSpotViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import Foundation
import Combine

class HikingSpotViewModel: ObservableObject {
    @Published var hikingSpots: [HikingSpot] = []
    @Published var filteredHikingSpots: [HikingSpot] = []

    init() {
        self.hikingSpots = HikingSampleData.hikingSpots
    }

    func filterHikingSpots(by level: DifficultyLevel, and mode: ModeOfTransportation) {
        filteredHikingSpots = hikingSpots.filter { $0.level == level && $0.mode == mode }
    }
}







