//
//  HikingViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import UIKit
import Combine

class HikingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private var viewModel = HikingSpotViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        navigationItem.title = "Hiking Spots"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HikingSpotTableViewCell.self, forCellReuseIdentifier: "hikingSpotCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.$hikingSpots.sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hikingSpots.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hikingSpotCell", for: indexPath) as! HikingSpotTableViewCell
        let hikingSpot = viewModel.hikingSpots[indexPath.row]
        cell.configure(with: hikingSpot)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedHikingSpot = viewModel.hikingSpots[indexPath.row]
        let detailVC = HikingSpotDetailViewController(hikingSpot: selectedHikingSpot)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

