//
//  CarDetailView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

//import SwiftUI
//
//struct CarDetailView: View {
//    var car: Car
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            if let imageUrl = URL(string: car.picture) {
//                AsyncImage(url: imageUrl)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 200)
//            } else {
//                ProgressView()
//                    .frame(height: 200)
//            }
//            Text(car.name)
//                .font(.title)
//                .padding(.top)
//            Text("Price: \(car.price) $/day")
//                .font(.headline)
//                .padding(.top, 2)
//            Text(car.description)
//                .font(.body)
//                .padding(.top, 2)
//        }
//        .padding()
//        .navigationTitle(car.name)
//    }
//}
