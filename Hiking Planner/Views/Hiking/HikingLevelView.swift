//
//  HikingLevelView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Hiking Level View
struct HikingLevelView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: HikingSpotViewModel
    var levels: [Level]
    var title: String

    // MARK: - Body
    var body: some View {
        VStack {
            ForEach(levels) { level in
                NavigationLink(destination: HikingSpotsView(viewModel: viewModel, hikingSpots: level.hikingSpots, title: level.name)) {
                    ZStack {
                        viewModel.loadImage(from: level.image, width: UIScreen.main.bounds.width, height: 200)
                            .cornerRadius(10)
                            .clipped()

                        Text(level.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding([.leading, .trailing], 5)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(5)
                    }
                    .padding(.bottom, 10)
                }
            }
        }
        .navigationTitle(title)
    }
}
