//
//  ContentView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HotelsViewControllerWrapper()
                .tabItem {
                    Image(systemName: "bed.double.fill")
                    Text("Hotels")
                }

            CarRentalViewControllerWrapper()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Cars")
                }

            HikingViewControllerWrapper()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Hiking Spots")
                }

            HomeViewControllerWrapper()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SearchViewControllerWrapper()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct HomeViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HomeViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct SearchViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: SearchViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct HotelsViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HotelsViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct CarRentalViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: CarRentalViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct HikingViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HikingViewController())
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
