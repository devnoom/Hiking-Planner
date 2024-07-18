////
////  StateListViewController.swift
////  Hiking Planner
////
////  Created by MacBook Air on 17.07.24.
////
//
//import UIKit
//import SwiftUI
//
//class StateListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    private let tableView = UITableView()
//    private var viewModel = HotelViewModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//
//    private func setupUI() {
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.title = "States"
//
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.states.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
//        let state = viewModel.states[indexPath.row]
//        cell.textLabel?.text = state.name
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let selectedState = viewModel.states[indexPath.row]
//        viewModel.fetchHotels(for: selectedState)
//        let hotelListVC = HotelListViewController(viewModel: viewModel, selectedState: selectedState)
//        navigationController?.pushViewController(hotelListVC, animated: true)
//    }
//}
