//
//  RoomRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

// MARK: - Room Row View
struct RoomRowView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: RoomViewModel
    var room: Room

    // MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            viewModel.loadImage(from: room.mainPicture, width: 100, height: 100)
                .cornerRadius(8)
                .clipped()

            VStack(alignment: .leading) {
                Text(room.name)
                    .font(.headline)
                Text("$\(room.price, specifier: "%.2f") per night")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "bed.double.fill")
                        .foregroundColor(.gray)
                    Text("\(room.numberOfBeds) beds")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.gray)
                    Text("Capacity: \(room.numberOfPeople) people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding()
    }
}
