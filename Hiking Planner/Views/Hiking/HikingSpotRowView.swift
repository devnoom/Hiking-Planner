//
//  HikingSpotRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

// MARK: - Hiking Spot Row View
struct HikingSpotRowView: View {
    @ObservedObject var viewModel: HikingSpotViewModel
    var hikingSpot: HikingSpot

    var body: some View {
        HStack {
            viewModel.loadImage(from: hikingSpot.image, width: 100, height: 100)
                .cornerRadius(8)
                .clipped()

            VStack(alignment: .leading) {
                Text(hikingSpot.name)
                    .font(.headline)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(hikingSpot.rating.rounded()) ? "star.fill" : "star")
                            .foregroundColor(index < Int(hikingSpot.rating.rounded()) ? .yellow : .gray)
                    }
                    Text(viewModel.ratingText(for: hikingSpot))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)
            }
            .padding(.leading, 10)
        }
        .padding()
    }
}
