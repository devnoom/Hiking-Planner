//
//  HikingSpotDetailView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

struct HikingSpotDetailView: View {
    var hikingSpot: HikingSpot

    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = URL(string: hikingSpot.image) {
                AsyncImage(url: imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            } else {
                ProgressView()
                    .frame(height: 200)
            }
            Text(hikingSpot.name)
                .font(.title)
                .padding(.top)
            Text("Rating: \(String(format: "%.1f", hikingSpot.rating))")
                .font(.headline)
                .padding(.top, 2)
            Text(hikingSpot.description)
                .font(.body)
                .padding(.top, 2)
        }
        .padding()
        .navigationTitle(hikingSpot.name)
    }
}

