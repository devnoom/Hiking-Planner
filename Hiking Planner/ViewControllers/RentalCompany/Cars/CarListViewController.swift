//
//  CarListViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import UIKit
import SwiftUI

// MARK: - Car List View Controller
final class CarListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Properties
    private let tableView = UITableView()
    private let viewModel: CarViewModel

    // MARK: - Initialization
    init(cars: [Car]) {
        self.viewModel = CarViewModel(cars: cars)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        navigationItem.title = "Cars"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CarCell")
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let car = viewModel.cars[indexPath.row]

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let carRowView = CarRowView(viewModel: viewModel, car: car)
        let hostingController = UIHostingController(rootView: carRowView)
        addChild(hostingController)
        cell.contentView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCar = viewModel.cars[indexPath.row]
        let carDetailViewController = CarDetailViewController(car: selectedCar)
        navigationController?.pushViewController(carDetailViewController, animated: true)
    }
}
