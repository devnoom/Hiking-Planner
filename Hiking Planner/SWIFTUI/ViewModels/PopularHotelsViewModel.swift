//
//  PopularHotelsViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import Foundation

// MARK: - Popular Hotels View Model
final class PopularHotelsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var hotels: [PopularHotel] = []
    
    // MARK: - Methods
    func fetchHotels() {
        DataManager.shared.fetchAllData { result in
            switch result {
            case .success(let data):
                self.hotels = data.popularHotels
            case .failure(let error):
                print("Failed to fetch hotels: \(error)")
            }
        }
    }
    
    func getRandomHotel() -> PopularHotel? {
        return hotels.randomElement()
    }
    
    func createSearchResultItem(from hotel: PopularHotel) -> SearchResultItem {
        return SearchResultItem(
            name: hotel.name,
            description: hotel.description,
            imageUrl: hotel.image.absoluteString,
            additionalDetails: [
                "Location": hotel.location,
                "Price per Night": hotel.pricePerNight,
                "Rating": hotel.rating,
                "Amenities": hotel.amenities,
                "Room Types": hotel.roomTypes,
                "Check-in Time": hotel.checkInTime,
                "Check-out Time": hotel.checkOutTime
            ]
        )
    }
}
