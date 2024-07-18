//
//  RentalCompanyRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import SwiftUI

struct RentalCompanyRowView: View {
    var company: RentalCompany

    var body: some View {
        VStack {
            if let imageUrl = URL(string: company.image) {
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
            Text(company.name)
                .font(.headline)
                .padding(.top, 5)
            HStack(spacing: 2) {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(company.rating) ? "star.fill" : "star")
                        .foregroundColor(index < Int(company.rating) ? .yellow : .gray)
                }
                Text(String(format: "%.1f", company.rating))
                    .font(.subheadline)
            }
            .padding(.top, 2)
        }
        .padding()
    }
}
