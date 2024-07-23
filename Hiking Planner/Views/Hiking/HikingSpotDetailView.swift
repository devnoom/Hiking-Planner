//
//  HikingSpotDetailView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI
import AVKit

// MARK: - Hiking Spot Detail View
struct HikingSpotDetailView: View {
    
    @ObservedObject var viewModel: HikingSpotViewModel
    var hikingSpot: HikingSpot

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let videoUrl = URL(string: hikingSpot.video) {
                    VideoPlayer(player: AVPlayer(url: videoUrl))
                        .frame(height: 300)
                } else {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(hikingSpot.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    Text(hikingSpot.description)
                        .font(.body)
                        .padding(.top)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Rating:")
                            .font(.headline)
                        Spacer()
                        Text(viewModel.ratingText(for: hikingSpot))
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                        Text("Location:")
                            .font(.headline)
                        Spacer()
                        Text(hikingSpot.location)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.orange)
                        Text("Travel Time:")
                            .font(.headline)
                        Spacer()
                        Text(hikingSpot.travelTime)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.green)
                        Text("Tips:")
                            .font(.headline)
                        Spacer()
                        Text(hikingSpot.tips)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "bag.fill")
                            .foregroundColor(.red)
                        Text("Things to Take:")
                            .font(.headline)
                        Spacer()
                        Text(hikingSpot.thingsToTake)
                            .font(.subheadline)
                    }
                    
                    Text("Additional Information")
                        .font(.headline)
                        .padding(.top)
                    
                    Text(hikingSpot.additionalInfo)
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle(hikingSpot.name)
    }
}
