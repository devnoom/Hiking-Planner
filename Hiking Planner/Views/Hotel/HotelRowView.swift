//
//  HotelRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

// MARK: - Hotel Row View
struct HotelRowView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: HotelViewModel
    var hotel: Hotel

    // MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            viewModel.loadImage(from: hotel.image, width: 100, height: 100)
                .cornerRadius(8)
                .clipped()

            VStack(alignment: .leading) {
                Text(hotel.name)
                    .font(.headline)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(hotel.rating.rounded()) ? "star.fill" : "star")
                            .foregroundColor(index < Int(hotel.rating.rounded()) ? .yellow : .gray)
                    }
                    Text(String(format: "%.1f", hotel.rating))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding()
    }
}
