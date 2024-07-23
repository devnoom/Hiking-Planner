//
//  RentalCompanyViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Rental Company View Model
final class RentalCompanyViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var rentalCompanies: [RentalCompany] = []
    
    // MARK: - Initialization
    init() {
        self.rentalCompanies = RentalCompany.sampleData
    }
    
    // MARK: - Methods
    func roundedRating(for company: RentalCompany) -> Double {
        return company.rating.rounded()
    }
    
    func ratingText(for company: RentalCompany) -> String {
        return String(format: "%.1f", company.rating)
    }
    
    func image(for company: RentalCompany) -> AnyView {
        if let url = URL(string: company.image) {
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
