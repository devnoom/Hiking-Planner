//
//  RoomDetailViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import UIKit
import SwiftUI

// MARK: - Room Detail View Controller
final class RoomDetailViewController: UIViewController {
    // MARK: - Properties
    private let room: Room
    private let viewModel: RoomViewModel

    // MARK: - Initialization
    init(viewModel: RoomViewModel, room: Room) {
        self.viewModel = viewModel
        self.room = room
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
        navigationItem.title = room.name
        view.backgroundColor = .white

        let roomDetailView = RoomDetailView(viewModel: viewModel, room: room)
        let hostingController = UIHostingController(rootView: roomDetailView)
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
