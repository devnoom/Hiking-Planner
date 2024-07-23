//
//  RoomDetailView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

// MARK: - Room Detail View
struct RoomDetailView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: RoomViewModel
    var room: Room
    @State private var currentMainPicture: String

    // MARK: - Initialization
    init(viewModel: RoomViewModel, room: Room) {
        self.viewModel = viewModel
        self.room = room
        self._currentMainPicture = State(initialValue: room.mainPicture)
    }

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                viewModel.loadImage(from: currentMainPicture, width: UIScreen.main.bounds.width, height: 300)
                    .clipped()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(room.additionalPictures, id: \.self) { picture in
                            viewModel.loadImage(from: picture, width: 100, height: 100)
                                .cornerRadius(8)
                                .clipped()
                                .padding(.trailing, 8)
                                .onTapGesture {
                                    currentMainPicture = picture
                                }
                        }
                    }
                    .padding()
                }

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Name:")
                            .font(.headline)
                        Spacer()
                        Text(room.name)
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Price:")
                            .font(.headline)
                        Spacer()
                        Text("$\(room.price, specifier: "%.2f") per night")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Description:")
                            .font(.headline)
                        Spacer()
                        Text(room.description)
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Capacity:")
                            .font(.headline)
                        Spacer()
                        Text("\(room.numberOfPeople) people")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Beds:")
                            .font(.headline)
                        Spacer()
                        Text("\(room.numberOfBeds) beds")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Floor:")
                            .font(.headline)
                        Spacer()
                        Text("\(room.floor)")
                            .font(.subheadline)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(room.name)
    }
}
