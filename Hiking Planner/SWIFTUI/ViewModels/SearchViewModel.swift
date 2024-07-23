//
//  SearchViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 23.07.24.
//

import Foundation
import Combine

// MARK: - Search Result Item
struct SearchResultItem {
    let name: String
    let description: String
    let imageUrl: String
    let additionalDetails: [String: String]
}

// MARK: - Search View Model
final class SearchViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var hotels: [PopularHotel] = []
    @Published var cars: [PopularCar] = []
    @Published var hikingSpots: [PopularHikingSpot] = []
    @Published var filteredData: [SearchResultItem] = []
    
    // MARK: - Private Properties
    private let hikingSpotsViewModel = PopularHikingSpotsViewModel()
    private let carsViewModel = PopularCarsViewModel()
    private let hotelsViewModel = PopularHotelsViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init() {
        bindViewModels()
    }
    
    // MARK: - Private Methods
    private func bindViewModels() {
        hikingSpotsViewModel.$hikingSpots
            .sink { [weak self] spots in
                self?.hikingSpots = spots
                self?.filterData(searchText: "", segmentIndex: 0)
            }
            .store(in: &cancellables)
        
        carsViewModel.$cars
            .sink { [weak self] cars in
                self?.cars = cars
                self?.filterData(searchText: "", segmentIndex: 1)
            }
            .store(in: &cancellables)
        
        hotelsViewModel.$hotels
            .sink { [weak self] hotels in
                self?.hotels = hotels
                self?.filterData(searchText: "", segmentIndex: 2)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Methods
    func fetchData() {
        hikingSpotsViewModel.fetchHikingSpots()
        carsViewModel.fetchCars()
        hotelsViewModel.fetchHotels()
    }
    
    func filterData(searchText: String, segmentIndex: Int) {
        let lowercasedSearchText = searchText.lowercased()
        switch segmentIndex {
        case 0:
            filteredData = hotels.filter { $0.name.lowercased().contains(lowercasedSearchText) }
                .map { hotel in
                    SearchResultItem(
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
        case 1:
            filteredData = cars.filter { $0.name.lowercased().contains(lowercasedSearchText) }
                .map { car in
                    SearchResultItem(
                        name: car.name,
                        description: car.description,
                        imageUrl: car.image.absoluteString,
                        additionalDetails: [
                            "Price per Day": car.pricePerDay,
                            "Seating Capacity": car.seatingCapacity,
                            "Fuel Type": car.fuelType,
                            "Transmission": car.transmission,
                            "Year": car.year,
                            "Mileage": car.mileage
                        ]
                    )
                }
        case 2:
            filteredData = hikingSpots.filter { $0.name.lowercased().contains(lowercasedSearchText) }
                .map { spot in
                    SearchResultItem(
                        name: spot.name,
                        description: spot.description,
                        imageUrl: spot.image.absoluteString,
                        additionalDetails: [
                            "Location": spot.location,
                            "Hiking Time": spot.hikingTime,
                            "Tips": spot.tips,
                            "Difficulty": spot.difficulty,
                            "Best Season": spot.bestSeason
                        ]
                    )
                }
        default:
            filteredData = []
        }
    }
    
    func updatePlaceholderLabel(searchText: String) -> String {
        if searchText.isEmpty {
            return "Use magic search for searching the item you want."
        } else if filteredData.isEmpty {
            return "There are no items you searched for."
        }
        return ""
    }
}
