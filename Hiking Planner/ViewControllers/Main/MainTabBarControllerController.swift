//
//  MainTabBarControllerController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 23.06.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        let hotelsVC = UINavigationController(rootViewController: HotelListViewController())
        hotelsVC.tabBarItem = UITabBarItem(title: "Hotels", image: UIImage(systemName: "bed.double.fill"), tag: 2)

        let carRentalVC = UINavigationController(rootViewController: RentalCompanyListViewController())
        carRentalVC.tabBarItem = UITabBarItem(title: "Car Rentals", image: UIImage(systemName: "car.fill"), tag: 3)

        let hikingVC = UINavigationController(rootViewController: HikingViewController())
        hikingVC.tabBarItem = UITabBarItem(title: "Hiking", image: UIImage(systemName: "figure.walk"), tag: 4)

        viewControllers = [homeVC, searchVC, hotelsVC, carRentalVC, hikingVC]
    }
}





