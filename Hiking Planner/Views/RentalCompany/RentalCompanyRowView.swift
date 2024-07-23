//
//  RentalCompanyRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

// MARK: - Rental Company Row View
struct RentalCompanyRowView: View {
    
    @ObservedObject var viewModel: RentalCompanyViewModel
    var company: RentalCompany

    var body: some View {
        HStack(alignment: .top) {
            viewModel.image(for: company)
            
            VStack(alignment: .leading) {
                Text(company.name)
                    .font(.headline)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(viewModel.roundedRating(for: company)) ? "star.fill" : "star")
                            .foregroundColor(index < Int(viewModel.roundedRating(for: company)) ? .yellow : .gray)
                    }
                    Text(viewModel.ratingText(for: company))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding()
    }
}
