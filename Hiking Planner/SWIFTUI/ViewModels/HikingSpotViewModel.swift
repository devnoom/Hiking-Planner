//
//  HikingSpotViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.06.24.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Hiking Spot View Model
final class HikingSpotViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var hikingSpots: [HikingSpot] = []
    @Published var filteredHikingSpots: [HikingSpot] = []
    
    // MARK: - Initialization
    init() {
        self.hikingSpots = HikingSampleData.transportTypes.flatMap { $0.levels.flatMap { $0.hikingSpots } }
    }
    
    // MARK: - Methods
    func filterHikingSpots(by level: Level, and transportType: TransportType) {
        filteredHikingSpots = level.hikingSpots
    }
    
    func loadImage(from urlString: String, width: CGFloat, height: CGFloat) -> AnyView {
        if let url = URL(string: urlString) {
            return AnyView(
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width, height: height)
                            .cornerRadius(8)
                            .clipped()
                    } else {
                        Color.gray
                            .frame(width: width, height: height)
                            .cornerRadius(8)
                    }
                }
            )
        } else {
            return AnyView(
                Color.gray
                    .frame(width: width, height: height)
                    .cornerRadius(8)
            )
        }
    }
    
    func ratingText(for hikingSpot: HikingSpot) -> String {
        return String(format: "%.1f", hikingSpot.rating)
    }
}
