//
//  CarViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import UIKit
import Combine

// MARK: - Car View Controller
final class CarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    private let tableView = UITableView()
    private var viewModel = CarViewModel()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindViewModel()
    }

    // MARK: - UI Setup
    private func setupUI() {
        navigationItem.title = "Cars"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: "carCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Bind ViewModel
    private func bindViewModel() {
        viewModel.$cars.sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell
        let car = viewModel.cars[indexPath.row]
        cell.configure(with: car)
        return cell
    }
}
