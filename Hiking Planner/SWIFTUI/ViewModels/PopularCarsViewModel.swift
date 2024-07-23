//
//  PopularCarsViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import Foundation

// MARK: - Popular Cars View Model
final class PopularCarsViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var cars: [PopularCar] = []
    
    // MARK: - Methods
    func fetchCars() {
        DataManager.shared.fetchAllData { result in
            switch result {
            case .success(let data):
                self.cars = data.popularCars
            case .failure(let error):
                print("Failed to fetch cars: \(error)")
            }
        }
    }
    
    func getRandomCar() -> PopularCar? {
        return cars.randomElement()
    }
    
    func createSearchResultItem(from car: PopularCar) -> SearchResultItem {
        return SearchResultItem(
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
}
