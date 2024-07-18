////
////  HotelDetailsViewController.swift
////  Hiking Planner
////
////  Created by MacBook Air on 13.07.24.
////
//
//import UIKit
//
//class HotelDetailViewController: UIViewController {
//    private let hotel: Hotel
//    
//    init(hotel: Hotel) {
//        self.hotel = hotel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//
//    private func setupUI() {
//        // Set up the navigation title
//        navigationItem.title = hotel.name
//        
//        // Display hotel details
//        let label = UILabel()
//        label.text = "Rooms:\n" + hotel.rooms.map { "\($0.name): $\(String(format: "%.2f", $0.price))" }.joined(separator: "\n")
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(label)
//        
//        // Add constraints
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//}
//
