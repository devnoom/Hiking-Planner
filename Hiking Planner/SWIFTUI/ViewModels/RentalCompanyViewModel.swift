//
//  RentalCompanyViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import Foundation
import Combine

class RentalCompanyViewModel: ObservableObject {
    @Published var rentalCompanies: [RentalCompany] = []

    init() {
        self.rentalCompanies = RentalCompany.sampleData
    }
}
