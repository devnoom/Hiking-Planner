
//
//  HotelViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import Foundation
import Combine

class HotelViewModel: ObservableObject {
    @Published var hotels: [Hotel] = []

    init() {
        self.hotels = SampleData.hotels
    }
}


