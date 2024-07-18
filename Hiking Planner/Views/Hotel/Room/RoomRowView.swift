//
//  RoomRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

struct RoomRowView: View {
    var room: Room

    var body: some View {
        VStack {
            if let imageUrl = URL(string: room.picture) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                    } else if phase.error != nil {
                        Color.red // Indicates an error
                            .frame(width: 150, height: 150)
                    } else {
                        ProgressView()
                            .frame(width: 150, height: 150)
                    }
                }
            } else {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            Text(room.name)
                .font(.headline)
                .padding(.top, 5)
            Text("$\(room.price) per night")
                .font(.subheadline)
        }
        .padding()
    }
}

struct RoomRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoomRowView(room: Room(name: "Sample Room", price: 100.0, picture: "https://example.com/room.jpg", description: "A sample room description"))
    }
}
