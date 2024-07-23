//
//  PopularHikingSpotsViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 20.07.24.
//

import Foundation
import Combine

// MARK: - Popular Hiking Spots View Model
final class PopularHikingSpotsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var hikingSpots: [PopularHikingSpot] = []
    
    // MARK: - Methods
    func fetchHikingSpots() {
        DataManager.shared.fetchAllData { result in
            switch result {
            case .success(let data):
                self.hikingSpots = data.popularHikingSpots
            case .failure(let error):
                print("Failed to fetch hiking spots: \(error)")
            }
        }
    }
    
    func getRandomHikingSpot() -> PopularHikingSpot? {
        return hikingSpots.randomElement()
    }
    
    func createSearchResultItem(from hikingSpot: PopularHikingSpot) -> SearchResultItem {
        return SearchResultItem(
            name: hikingSpot.name,
            description: hikingSpot.description,
            imageUrl: hikingSpot.image.absoluteString,
            additionalDetails: [
                "Location": hikingSpot.location,
                "Hiking Time": hikingSpot.hikingTime,
                "Tips": hikingSpot.tips,
                "Difficulty": hikingSpot.difficulty,
                "Best Season": hikingSpot.bestSeason
            ]
        )
    }
}
