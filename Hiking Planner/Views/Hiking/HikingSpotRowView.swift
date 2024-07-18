//
//  HikingSpotRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

struct HikingSpotRowView: View {
    var hikingSpot: HikingSpot

    var body: some View {
        HStack {
            if let imageUrl = URL(string: hikingSpot.image) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    } else if phase.error != nil {
                        Color.red // Indicates an error
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    }
                }
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(hikingSpot.name)
                    .font(.headline)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(hikingSpot.rating.rounded()) ? "star.fill" : "star")
                            .foregroundColor(index < Int(hikingSpot.rating.rounded()) ? .yellow : .gray)
                    }
                    Text(String(format: "%.1f", hikingSpot.rating))
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

