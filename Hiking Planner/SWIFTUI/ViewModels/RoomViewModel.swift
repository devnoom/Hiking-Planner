//
//  RoomViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 22.07.24.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Room View Model
final class RoomViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var rooms: [Room]
    @Published var selectedRoom: Room?

    // MARK: - Initialization
    init(rooms: [Room]) {
        self.rooms = rooms
    }

    // MARK: - Methods
    func selectRoom(_ room: Room) {
        selectedRoom = room
    }

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
