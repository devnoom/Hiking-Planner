//
//  TransportTypeView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Transport Type View
struct TransportTypeView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: HikingSpotViewModel
    var transportTypes: [TransportType] = HikingSampleData.transportTypes

    // MARK: - Body
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Text("Select Transport Type")
                        .font(.largeTitle)
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                        ForEach(transportTypes) { transportType in
                            NavigationLink(destination: HikingLevelView(viewModel: viewModel, levels: transportType.levels, title: transportType.name)) {
                                ZStack {
                                    viewModel.loadImage(from: transportType.image, width: geometry.size.width / 2, height: geometry.size.height / 2 - 40)
                                        .clipped()
                                    
                                    VStack {
                                        Spacer()
                                        VStack {
                                            Text(transportType.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.bottom, 2)
                                            Text(transportType.description)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .background(Color.black.opacity(0.6))
                                        .cornerRadius(8)
                                        .padding(.bottom, 10)
                                    }
                                }
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2 - 40)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .navigationBarHidden(true)
            }
        }
    }
}
