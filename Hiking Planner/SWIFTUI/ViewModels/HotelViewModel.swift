//
//  HotelViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Hotel View Model
final class HotelViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var hotels: [Hotel] = []

    // MARK: - Initialization
    init() {
        self.hotels = SampleData.hotels
    }

    // MARK: - Methods
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
}
