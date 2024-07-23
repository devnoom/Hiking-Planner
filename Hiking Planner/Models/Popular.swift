//
//  Popular.swift
//  Hiking Planner
//
//  Created by MacBook Air on 20.07.24.
//

import Foundation

// MARK: - Popular Hiking Spot Model
struct PopularHikingSpot: Codable {
    let name: String
    let image: URL
    let description: String
    let location: String
    let hikingTime: String
    let tips: String
    let difficulty: String
    let bestSeason: String
}

// MARK: - Popular Car Model
struct PopularCar: Codable {
    let name: String
    let image: URL
    let description: String
    let pricePerDay: String
    let seatingCapacity: String
    let fuelType: String
    let transmission: String
    let year: String
    let mileage: String
}

// MARK: - Popular Hotel Model
struct PopularHotel: Codable {
    let name: String
    let image: URL
    let description: String
    let location: String
    let pricePerNight: String
    let rating: String
    let amenities: String
    let roomTypes: String
    let checkInTime: String
    let checkOutTime: String
}

// MARK: - App Data
struct AppData: Codable {
    let popularHikingSpots: [PopularHikingSpot]
    let popularCars: [PopularCar]
    let popularHotels: [PopularHotel]
}
