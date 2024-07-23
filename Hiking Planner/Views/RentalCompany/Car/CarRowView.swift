//
//  CarRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Car Row View
struct CarRowView: View {
    @ObservedObject var viewModel: CarViewModel
    var car: Car

    var body: some View {
        HStack {
            viewModel.image(for: car)

            VStack(alignment: .leading) {
                Text(car.name)
                    .font(.headline)
                Text(viewModel.priceText(for: car))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(car.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding()
    }
}
