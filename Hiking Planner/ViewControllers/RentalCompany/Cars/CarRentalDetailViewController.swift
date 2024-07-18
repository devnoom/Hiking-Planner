//
//  CarRentalDetailViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 13.07.24.
//

import UIKit

class CarRentalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rental Companies"

        let rentalCompanyListViewController = RentalCompanyListViewController()
        addChild(rentalCompanyListViewController)
        view.addSubview(rentalCompanyListViewController.view)
        rentalCompanyListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rentalCompanyListViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            rentalCompanyListViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rentalCompanyListViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rentalCompanyListViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        rentalCompanyListViewController.didMove(toParent: self)
    }
}




