//
//  CarViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Car View Model
final class CarViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var cars: [Car]
    
    // MARK: - Initialization
    init(cars: [Car] = []) {
        self.cars = cars
    }
    
    // MARK: - Methods
    func priceText(for car: Car) -> String {
        return "$\(car.price) per day"
    }
    
    func image(for car: Car) -> AnyView {
        if let url = URL(string: car.picture) {
            return AnyView(
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                            .clipped()
                    } else {
                        Color.gray
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    }
                }
            )
        } else {
            return AnyView(
                Color.gray
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            )
        }
    }
}
