//
//  DetailViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import UIKit

// MARK: - Detail View Controller
final class DetailViewController: UIViewController {
    // MARK: - Properties
    private let item: SearchResultItem
    
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
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    init(item: SearchResultItem) {
        self.item = item
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
        configure(with: item)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(itemImageView)
        contentView.addSubview(informationStackView)
        
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
            
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            itemImageView.heightAnchor.constraint(equalToConstant: 300),
            
            informationStackView.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 20),
            informationStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            informationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            informationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Configuration
    private func configure(with item: SearchResultItem) {
        loadImage(from: item.imageUrl, into: itemImageView)
        
        informationStackView.addArrangedSubview(createInformationRow(title: "Name", value: item.name, icon: UIImage(systemName: "person.fill")))
        informationStackView.addArrangedSubview(createInformationRow(title: "Description", value: item.description, icon: UIImage(systemName: "info.circle.fill")))
        
        for (key, value) in item.additionalDetails {
            let icon: UIImage?
            switch key {
            case "Location":
                icon = UIImage(systemName: "map.fill")
            case "Price per Night", "Price per Day":
                icon = UIImage(systemName: "dollarsign.circle.fill")
            case "Rating":
                icon = UIImage(systemName: "star.fill")
            case "Amenities":
                icon = UIImage(systemName: "house.fill")
            case "Room Types":
                icon = UIImage(systemName: "bed.double.fill")
            case "Check-in Time", "Check-out Time":
                icon = UIImage(systemName: "clock.fill")
            case "Seating Capacity":
                icon = UIImage(systemName: "person.3.fill")
            case "Fuel Type":
                icon = UIImage(systemName: "car.fill")
            case "Transmission":
                icon = UIImage(systemName: "gearshape.fill")
            case "Year":
                icon = UIImage(systemName: "calendar")
            case "Mileage":
                icon = UIImage(systemName: "speedometer")
            case "Hiking Time":
                icon = UIImage(systemName: "timer")
            case "Tips":
                icon = UIImage(systemName: "lightbulb.fill")
            case "Difficulty":
                icon = UIImage(systemName: "exclamationmark.triangle.fill")
            case "Best Season":
                icon = UIImage(systemName: "leaf.fill")
            default:
                icon = UIImage(systemName: "info.circle.fill")
            }
            
            informationStackView.addArrangedSubview(createInformationRow(title: key, value: value, icon: icon))
        }
    }
    
    // MARK: - Helper Methods
    private func createInformationRow(title: String, value: String, icon: UIImage?) -> UIStackView {
        let iconImageView = UIImageView()
        iconImageView.image = icon
        iconImageView.tintColor = .systemBlue
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.numberOfLines = 0
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, textStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
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
