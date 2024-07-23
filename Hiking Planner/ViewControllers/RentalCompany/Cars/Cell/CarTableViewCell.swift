//
//  CarTableViewCell.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import UIKit

// MARK: - Car Table View Cell
final class CarTableViewCell: UITableViewCell {
    // MARK: - UI Components
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let carImageView = UIImageView()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupUI() {
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(carImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            carImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 8),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 8),
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    // MARK: - Configuration
    func configure(with car: Car) {
        nameLabel.text = car.name
        priceLabel.text = "$\(car.price) per day"
        descriptionLabel.text = car.description
        if let imageUrl = URL(string: car.picture) {
            carImageView.loadImage(from: imageUrl)
        }
    }
}
