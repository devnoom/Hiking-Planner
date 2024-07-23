//
//  RandomViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import UIKit

// MARK: - Random View Controller
final class RandomViewController: UIViewController {
    // MARK: - Properties
    private let hotel: PopularHotel?
    private let car: PopularCar?
    private let hikingSpot: PopularHikingSpot?
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let hotelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hikingSpotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hotelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let carLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hikingSpotLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    init(hotel: PopularHotel?, car: PopularCar?, hikingSpot: PopularHikingSpot?) {
        self.hotel = hotel
        self.car = car
        self.hikingSpot = hikingSpot
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureViews()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(hotelImageView)
        contentView.addSubview(hotelLabel)
        contentView.addSubview(carImageView)
        contentView.addSubview(carLabel)
        contentView.addSubview(hikingSpotImageView)
        contentView.addSubview(hikingSpotLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            hotelImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            hotelImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hotelImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            hotelImageView.heightAnchor.constraint(equalToConstant: 200),
            
            hotelLabel.topAnchor.constraint(equalTo: hotelImageView.bottomAnchor, constant: 10),
            hotelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hotelLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            carImageView.topAnchor.constraint(equalTo: hotelLabel.bottomAnchor, constant: 20),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            carImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            
            carLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            carLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            carLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            hikingSpotImageView.topAnchor.constraint(equalTo: carLabel.bottomAnchor, constant: 20),
            hikingSpotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hikingSpotImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            hikingSpotImageView.heightAnchor.constraint(equalToConstant: 200),
            
            hikingSpotLabel.topAnchor.constraint(equalTo: hikingSpotImageView.bottomAnchor, constant: 10),
            hikingSpotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hikingSpotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            hikingSpotLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Configuration
    private func configureViews() {
        if let hotel = hotel {
            hotelLabel.text = hotel.name
            loadImage(from: hotel.image.absoluteString, into: hotelImageView)
        } else {
            hotelLabel.text = "No Hotel Found"
        }
        
        if let car = car {
            carLabel.text = car.name
            loadImage(from: car.image.absoluteString, into: carImageView)
        } else {
            carLabel.text = "No Car Found"
        }
        
        if let hikingSpot = hikingSpot {
            hikingSpotLabel.text = hikingSpot.name
            loadImage(from: hikingSpot.image.absoluteString, into: hikingSpotImageView)
        } else {
            hikingSpotLabel.text = "No Hiking Spot Found"
        }
        
        let tapHotel = UITapGestureRecognizer(target: self, action: #selector(hotelTapped))
        hotelImageView.isUserInteractionEnabled = true
        hotelImageView.addGestureRecognizer(tapHotel)
        
        let tapCar = UITapGestureRecognizer(target: self, action: #selector(carTapped))
        carImageView.isUserInteractionEnabled = true
        carImageView.addGestureRecognizer(tapCar)
        
        let tapHikingSpot = UITapGestureRecognizer(target: self, action: #selector(hikingSpotTapped))
        hikingSpotImageView.isUserInteractionEnabled = true
        hikingSpotImageView.addGestureRecognizer(tapHikingSpot)
    }
    
    // MARK: - Actions
    @objc private func hotelTapped() {
        if let hotel = hotel {
            let selectedItem = SearchResultItem(
                name: hotel.name,
                description: hotel.description,
                imageUrl: hotel.image.absoluteString,
                additionalDetails: [
                    "Location": hotel.location,
                    "Price per Night": hotel.pricePerNight,
                    "Rating": hotel.rating,
                    "Amenities": hotel.amenities,
                    "Room Types": hotel.roomTypes,
                    "Check-in Time": hotel.checkInTime,
                    "Check-out Time": hotel.checkOutTime
                ]
            )
            let detailViewController = DetailViewController(item: selectedItem)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    @objc private func carTapped() {
        if let car = car {
            let selectedItem = SearchResultItem(
                name: car.name,
                description: car.description,
                imageUrl: car.image.absoluteString,
                additionalDetails: [
                    "Price per Day": car.pricePerDay,
                    "Seating Capacity": car.seatingCapacity,
                    "Fuel Type": car.fuelType,
                    "Transmission": car.transmission,
                    "Year": car.year,
                    "Mileage": car.mileage
                ]
            )
            let detailViewController = DetailViewController(item: selectedItem)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    @objc private func hikingSpotTapped() {
        if let hikingSpot = hikingSpot {
            let selectedItem = SearchResultItem(
                name: hikingSpot.name,
                description: hikingSpot.description,
                imageUrl: hikingSpot.image.absoluteString,
                additionalDetails: [
                    "Location": hikingSpot.location,
                    "Hiking Time": hikingSpot.hikingTime,
                    "Tips": hikingSpot.tips,
                    "Difficulty": hikingSpot.difficulty,
                    "Best Season": hikingSpot.bestSeason
                ]
            )
            let detailViewController = DetailViewController(item: selectedItem)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    // MARK: - Helper Methods
    private func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
