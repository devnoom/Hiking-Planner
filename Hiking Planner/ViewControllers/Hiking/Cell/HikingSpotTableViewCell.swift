//
//  HikingSpotTableViewCell.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import UIKit

// MARK: - Hiking Spot Table View Cell
final class HikingSpotTableViewCell: UITableViewCell {
    // MARK: - UI Components
    private let spotImageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private var viewModel: HikingSpotViewModel?

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
        spotImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(spotImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            spotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            spotImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            spotImageView.widthAnchor.constraint(equalToConstant: 50),
            spotImageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.leadingAnchor.constraint(equalTo: spotImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Configuration
    func configure(with hikingSpot: HikingSpot, viewModel: HikingSpotViewModel) {
        self.viewModel = viewModel
        if let imageUrl = URL(string: hikingSpot.image) {
            let task = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.spotImageView.image = image
                    }
                }
            }
            task.resume()
        }
        nameLabel.text = hikingSpot.name
        descriptionLabel.text = hikingSpot.description
    }
}
