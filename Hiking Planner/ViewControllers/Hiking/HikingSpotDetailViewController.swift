//
//  HikingSpotDetailViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import UIKit
import SwiftUI

// MARK: - Hiking Spot Detail View Controller
final class HikingSpotDetailViewController: UIViewController {
    // MARK: - Properties
    private let hikingSpot: HikingSpot
    private let viewModel: HikingSpotViewModel

    // MARK: - Initialization
    init(hikingSpot: HikingSpot, viewModel: HikingSpotViewModel) {
        self.hikingSpot = hikingSpot
        self.viewModel = viewModel
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
        navigationItem.title = hikingSpot.name
        view.backgroundColor = .white

        let hikingSpotDetailView = HikingSpotDetailView(viewModel: viewModel, hikingSpot: hikingSpot)
        let hostingController = UIHostingController(rootView: hikingSpotDetailView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}
