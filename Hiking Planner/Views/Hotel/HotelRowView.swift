//
//  HotelRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

struct HotelRowView: View {
    var hotel: Hotel

    var body: some View {
        HStack {
            if let imageUrl = URL(string: hotel.image) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    } else if phase.error != nil {
                        Color.red // Indicates an error
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    }
                }
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(hotel.name)
                    .font(.headline)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(hotel.rating.rounded()) ? "star.fill" : "star")
                            .foregroundColor(index < Int(hotel.rating.rounded()) ? .yellow : .gray)
                    }
                    Text(String(format: "%.1f", hotel.rating))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)
            }
            .padding(.leading, 10)
        }
        .padding()
    }
}

struct HotelRowView_Previews: PreviewProvider {
    static var previews: some View {
        HotelRowView(hotel: Hotel(name: "Sample Hotel", description: "A sample hotel description", image: "https://example.com/hotel.jpg", rating: 4.5, rooms: []))
            .previewLayout(.sizeThatFits)
    }
}
