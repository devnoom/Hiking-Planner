//
//  HikingSpotTableViewCell.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import UIKit

class HikingSpotTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let hikingSpotImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        hikingSpotImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(hikingSpotImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            hikingSpotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hikingSpotImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hikingSpotImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hikingSpotImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: hikingSpotImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            ratingLabel.leadingAnchor.constraint(equalTo: hikingSpotImageView.trailingAnchor, constant: 8),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: hikingSpotImageView.trailingAnchor, constant: 8),
            descriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with hikingSpot: HikingSpot) {
        nameLabel.text = hikingSpot.name
        ratingLabel.text = "Rating: \(String(format: "%.1f", hikingSpot.rating))"
        descriptionLabel.text = hikingSpot.description
        if let imageUrl = URL(string: hikingSpot.image) {
            hikingSpotImageView.loadImage(from: imageUrl)
        }
    }
}

