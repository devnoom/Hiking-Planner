//
//  RoomDetailView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

struct RoomDetailView: View {
    var room: Room

    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = URL(string: room.picture) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                    } else if phase.error != nil {
                        Color.red // Indicates an error
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                    } else {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                    }
                }
            } else {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width, height: 300)
            }
            Text(room.name)
                .font(.largeTitle)
                .padding()
            Text(room.description)
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationTitle(room.name)
    }
}

struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailView(room: Room(name: "Sample Room", price: 100.0, picture: "https://example.com/room.jpg", description: "A sample room description"))
    }
}

