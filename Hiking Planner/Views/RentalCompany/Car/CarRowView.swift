//
//  CarRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

struct CarRowView: View {
    var car: Car

    var body: some View {
        HStack {
            if let imageUrl = URL(string: car.picture) {
                AsyncImage(url: imageUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text(car.name)
                    .font(.headline)
                Text("\(car.price) $/day")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}
