//
//  CarDetailViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import UIKit

// MARK: - Car Detail View Controller
final class CarDetailViewController: UIViewController {
    // MARK: - Properties
    private let car: Car
    
    // MARK: - UI Components
    private let imageView = UIImageView()
    private let carNameLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let seatsLabel = UILabel()
    private let fuelTypeLabel = UILabel()
    private let engineLabel = UILabel()

    private let priceIcon = UIImageView(image: UIImage(systemName: "dollarsign.circle.fill"))
    private let descriptionIcon = UIImageView(image: UIImage(systemName: "info.circle.fill"))
    private let seatsIcon = UIImageView(image: UIImage(systemName: "person.3.fill"))
    private let fuelTypeIcon = UIImageView(image: UIImage(systemName: "fuelpump.fill"))
    private let engineIcon = UIImageView(image: UIImage(systemName: "gearshape.fill"))

    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    // MARK: - Initialization
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
        self.title = "Car Details"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        seatsLabel.translatesAutoresizingMaskIntoConstraints = false
        fuelTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        engineLabel.translatesAutoresizingMaskIntoConstraints = false

        priceIcon.translatesAutoresizingMaskIntoConstraints = false
        descriptionIcon.translatesAutoresizingMaskIntoConstraints = false
        seatsIcon.translatesAutoresizingMaskIntoConstraints = false
        fuelTypeIcon.translatesAutoresizingMaskIntoConstraints = false
        engineIcon.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.numberOfLines = 0

        view.addSubview(imageView)
        view.addSubview(scrollView)
        view.addSubview(carNameLabel)
        view.addSubview(priceIcon)
        view.addSubview(priceLabel)
        view.addSubview(descriptionIcon)
        view.addSubview(descriptionLabel)
        view.addSubview(seatsIcon)
        view.addSubview(seatsLabel)
        view.addSubview(fuelTypeIcon)
        view.addSubview(fuelTypeLabel)
        view.addSubview(engineIcon)
        view.addSubview(engineLabel)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false

        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            carNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            carNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            scrollView.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            priceIcon.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            priceIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceIcon.widthAnchor.constraint(equalToConstant: 24),
            priceIcon.heightAnchor.constraint(equalToConstant: 24),

            priceLabel.centerYAnchor.constraint(equalTo: priceIcon.centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceIcon.trailingAnchor, constant: 8),

            descriptionIcon.topAnchor.constraint(equalTo: priceIcon.bottomAnchor, constant: 16),
            descriptionIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionIcon.widthAnchor.constraint(equalToConstant: 24),
            descriptionIcon.heightAnchor.constraint(equalToConstant: 24),

            descriptionLabel.centerYAnchor.constraint(equalTo: descriptionIcon.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionIcon.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            seatsIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            seatsIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            seatsIcon.widthAnchor.constraint(equalToConstant: 24),
            seatsIcon.heightAnchor.constraint(equalToConstant: 24),

            seatsLabel.centerYAnchor.constraint(equalTo: seatsIcon.centerYAnchor),
            seatsLabel.leadingAnchor.constraint(equalTo: seatsIcon.trailingAnchor, constant: 8),

            fuelTypeIcon.topAnchor.constraint(equalTo: seatsIcon.bottomAnchor, constant: 16),
            fuelTypeIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fuelTypeIcon.widthAnchor.constraint(equalToConstant: 24),
            fuelTypeIcon.heightAnchor.constraint(equalToConstant: 24),

            fuelTypeLabel.centerYAnchor.constraint(equalTo: fuelTypeIcon.centerYAnchor),
            fuelTypeLabel.leadingAnchor.constraint(equalTo: fuelTypeIcon.trailingAnchor, constant: 8),

            engineIcon.topAnchor.constraint(equalTo: fuelTypeIcon.bottomAnchor, constant: 16),
            engineIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            engineIcon.widthAnchor.constraint(equalToConstant: 24),
            engineIcon.heightAnchor.constraint(equalToConstant: 24),

            engineLabel.centerYAnchor.constraint(equalTo: engineIcon.centerYAnchor),
            engineLabel.leadingAnchor.constraint(equalTo: engineIcon.trailingAnchor, constant: 8)
        ])
    }

    // MARK: - Configuration
    private func configureUI() {
        carNameLabel.text = car.name
        carNameLabel.font = UIFont.boldSystemFont(ofSize: 20)

        priceLabel.text = "$\(car.price) per day"
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textColor = .systemGreen

        descriptionLabel.text = car.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .darkGray

        seatsLabel.text = "Seats: \(car.seats)"
        seatsLabel.font = UIFont.systemFont(ofSize: 14)

        fuelTypeLabel.text = "Fuel Type: \(car.fuelType)"
        fuelTypeLabel.font = UIFont.systemFont(ofSize: 14)

        engineLabel.text = "Engine: \(car.engine)"
        engineLabel.font = UIFont.systemFont(ofSize: 14)

        if let url = URL(string: car.picture) {
            imageView.loadImage(from: url)
        }

        for picture in car.additionalPictures {
            if let url = URL(string: picture) {
                let smallImageView = UIImageView()
                smallImageView.translatesAutoresizingMaskIntoConstraints = false
                smallImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
                smallImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                smallImageView.loadImage(from: url)
                smallImageView.layer.cornerRadius = 8
                smallImageView.clipsToBounds = true
                smallImageView.isUserInteractionEnabled = true
                smallImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(smallImageTapped(_:))))
                stackView.addArrangedSubview(smallImageView)
            }
        }
    }

    // MARK: - Actions
    @objc private func smallImageTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView, let image = imageView.image {
            self.imageView.image = image
        }
    }
}
