//
//  HotelsViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import UIKit
import SwiftUI
import Combine

// MARK: - Hotels View Controller
final class HotelsViewController: UIViewController {
    // MARK: - Properties
    private let tableView = UITableView()
    private var viewModel = HotelViewModel()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    // MARK: - UI Setup
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Hotels"

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HotelCell")
    }

    // MARK: - Bind View Model
    private func bindViewModel() {
        viewModel.$hotels
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: - UITableView Delegate & DataSource
extension HotelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hotels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath)
        let hotel = viewModel.hotels[indexPath.row]

        let hotelRowView = HotelRowView(viewModel: viewModel, hotel: hotel)
        let hostingController = UIHostingController(rootView: hotelRowView)
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
        let selectedHotel = viewModel.hotels[indexPath.row]
        let roomListViewModel = RoomViewModel(rooms: selectedHotel.rooms)
        let roomListVC = RoomListViewController(viewModel: roomListViewModel, selectedHotel: selectedHotel)
        navigationController?.pushViewController(roomListVC, animated: true)
    }
}
