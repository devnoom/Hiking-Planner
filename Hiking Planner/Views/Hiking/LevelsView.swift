//
//  LevelsView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Levels View
struct LevelsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: HikingSpotViewModel
    var levels: [Level]
    var title: String

    // MARK: - Body
    var body: some View {
        List(levels) { level in
            NavigationLink(destination: HikingSpotsView(viewModel: viewModel, hikingSpots: level.hikingSpots, title: level.name)) {
                HStack {
                    viewModel.loadImage(from: level.image, width: 50, height: 50)
                        .cornerRadius(8)
                        .clipped()

                    VStack(alignment: .leading) {
                        Text(level.name)
                            .font(.headline)
                        Text(level.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}
