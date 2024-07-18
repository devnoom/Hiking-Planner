//
//  HikingSpotListViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import UIKit
import SwiftUI
import Combine

class HikingSpotListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()
    private var viewModel = HikingSpotViewModel()
    private let selectedLevel: DifficultyLevel
    private let selectedMode: ModeOfTransportation
    private var cancellables = Set<AnyCancellable>()

    init(selectedLevel: DifficultyLevel, selectedMode: ModeOfTransportation) {
        self.selectedLevel = selectedLevel
        self.selectedMode = selectedMode
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "\(selectedLevel.rawValue) \(selectedMode.rawValue) Spots"

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HikingSpotCell")
    }

    private func bindViewModel() {
        viewModel.filterHikingSpots(by: selectedLevel, and: selectedMode)
        viewModel.$filteredHikingSpots.sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredHikingSpots.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HikingSpotCell", for: indexPath)
        let hikingSpot = viewModel.filteredHikingSpots[indexPath.row]

        let hikingSpotRowView = HikingSpotRowView(hikingSpot: hikingSpot)
        let hostingController = UIHostingController(rootView: hikingSpotRowView)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedHikingSpot = viewModel.filteredHikingSpots[indexPath.row]
        let detailVC = HikingSpotDetailViewController(hikingSpot: selectedHikingSpot)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
