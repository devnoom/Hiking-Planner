//
//  ContentView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import SwiftUI

// MARK: - Content View
struct ContentView: View {
    
    @StateObject private var viewModel = HikingSpotViewModel()

    var body: some View {
        TabView {
            HomeViewControllerWrapper()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            HotelsViewControllerWrapper()
                .tabItem {
                    Image(systemName: "bed.double.fill")
                    Text("Hotels")
                }

            TransportTypeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Hiking Spots")
                }
            
            CarRentalViewControllerWrapper()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Cars")
                }

            SearchViewControllerWrapper()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

// MARK: - Home View Controller Wrapper
struct HomeViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HomeViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

// MARK: - Search View Controller Wrapper
struct SearchViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: SearchViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

// MARK: - Hotels View Controller Wrapper
struct HotelsViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HotelsViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

// MARK: - Car Rental View Controller Wrapper
struct CarRentalViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: CarRentalViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
