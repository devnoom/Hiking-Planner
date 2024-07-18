//
//  ModeOfTransportationViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import UIKit
import SwiftUI

class ModeOfTransportationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()
    private let selectedLevel: DifficultyLevel

    init(selectedLevel: DifficultyLevel) {
        self.selectedLevel = selectedLevel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Modes of Transportation"

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ModeCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModeOfTransportation.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModeCell", for: indexPath)
        let mode = ModeOfTransportation.allCases[indexPath.row]
        cell.textLabel?.text = mode.rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMode = ModeOfTransportation.allCases[indexPath.row]
        let hikingSpotListVC = HikingSpotListViewController(selectedLevel: selectedLevel, selectedMode: selectedMode)
        navigationController?.pushViewController(hikingSpotListVC, animated: true)
    }
}
