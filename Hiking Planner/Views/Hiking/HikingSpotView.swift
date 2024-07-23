//
//  HikingSpotsView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Hiking Spots View
struct HikingSpotsView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: HikingSpotViewModel
    var hikingSpots: [HikingSpot]
    var title: String

    // MARK: - Body
    var body: some View {
        List(hikingSpots) { spot in
            NavigationLink(destination: HikingSpotDetailView(viewModel: viewModel, hikingSpot: spot)) {
                HStack(alignment: .top) {
                    viewModel.loadImage(from: spot.image, width: 100, height: 100)
                        .cornerRadius(8)
                        .clipped()

                    VStack(alignment: .leading, spacing: 8) {
                        Text(spot.name)
                            .font(.headline)
                        
                        HStack {
                            ForEach(0..<5) { index in
                                Image(systemName: index < Int(spot.rating.rounded()) ? "star.fill" : "star")
                                    .foregroundColor(index < Int(spot.rating.rounded()) ? .yellow : .gray)
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.gray)
                            Text(spot.location)
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
        .navigationTitle(title)
    }
}
