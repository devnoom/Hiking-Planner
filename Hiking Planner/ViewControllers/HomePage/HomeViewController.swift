//
//  HomeViewController.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import UIKit
import Combine

// MARK: - Home View Controller
final class HomeViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    private var hikingSpotsViewModel = PopularHikingSpotsViewModel()
    private var carsViewModel = PopularCarsViewModel()
    private var hotelsViewModel = PopularHotelsViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            return HomeViewController.createSectionLayout()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let randomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Random Picker", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(randomPickerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Click 'Random Picker' to get a random hiking spot, car, and hotel."
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindViewModel()
        fetchData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        navigationItem.title = "Home"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        
        view.addSubview(descriptionLabel)
        view.addSubview(randomButton)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            randomButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomButton.widthAnchor.constraint(equalToConstant: 200),
            randomButton.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: randomButton.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - View Model Binding
    private func bindViewModel() {
        hikingSpotsViewModel.$hikingSpots
            .combineLatest(carsViewModel.$cars, hotelsViewModel.$hotels)
            .receive(on: RunLoop.main)
            .sink { [weak self] _, _, _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Data Fetching
    private func fetchData() {
        hikingSpotsViewModel.fetchHikingSpots()
        carsViewModel.fetchCars()
        hotelsViewModel.fetchHotels()
    }
    
    // MARK: - Actions
    @objc private func randomPickerButtonTapped() {
        guard let randomHotel = hotelsViewModel.getRandomHotel(),
              let randomCar = carsViewModel.getRandomCar(),
              let randomHikingSpot = hikingSpotsViewModel.getRandomHikingSpot() else {
            return
        }
        
        let randomViewController = RandomViewController(hotel: randomHotel, car: randomCar, hikingSpot: randomHikingSpot)
        navigationController?.pushViewController(randomViewController, animated: true)
    }
    
    // MARK: - Collection View Layout
    static func createSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem: SearchResultItem
        switch indexPath.section {
        case 0:
            let item = hikingSpotsViewModel.hikingSpots[indexPath.item]
            selectedItem = hikingSpotsViewModel.createSearchResultItem(from: item)
        case 1:
            let item = carsViewModel.cars[indexPath.item]
            selectedItem = carsViewModel.createSearchResultItem(from: item)
        case 2:
            let item = hotelsViewModel.hotels[indexPath.item]
            selectedItem = hotelsViewModel.createSearchResultItem(from: item)
        default:
            return
        }
        
        let detailViewController = DetailViewController(item: selectedItem)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return hikingSpotsViewModel.hikingSpots.count
        case 1:
            return carsViewModel.cars.count
        case 2:
            return hotelsViewModel.hotels.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath) as! HorizontalCollectionViewCell
        
        switch indexPath.section {
        case 0:
            let item = hikingSpotsViewModel.hikingSpots[indexPath.item]
            cell.configure(with: HorizontalCollectionViewCell.Item(name: item.name, imageUrl: item.image.absoluteString)) // Convert URL to String
        case 1:
            let item = carsViewModel.cars[indexPath.item]
            cell.configure(with: HorizontalCollectionViewCell.Item(name: item.name, imageUrl: item.image.absoluteString)) // Convert URL to String
        case 2:
            let item = hotelsViewModel.hotels[indexPath.item]
            cell.configure(with: HorizontalCollectionViewCell.Item(name: item.name, imageUrl: item.image.absoluteString)) // Convert URL to String
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 0:
            headerView.title = "Popular Hiking Places"
        case 1:
            headerView.title = "Popular Cars"
        case 2:
            headerView.title = "Popular Hotels"
        default:
            break
        }
        
        return headerView
    }
}
