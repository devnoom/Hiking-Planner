//
//  RentalCompany.swift
//  Hiking Planner
//
//  Created by MacBook Air on 16.07.24.
//

import Foundation

struct RentalCompany: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let rating: Double
    let cars: [Car]
    
    static let sampleData: [RentalCompany] = [
        RentalCompany(
            name: "Top Cars",
            image: "https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            rating: 5.0,
            cars: [
                Car(name: "Luxury Black Car", price: 120, picture: "https://images.pexels.com/photos/26954166/pexels-photo-26954166/free-photo-of-luxury-black-car-in-garage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A luxurious black car perfect for city driving."),
                Car(name: "Mercedes-Benz S-Class", price: 150, picture: "https://images.pexels.com/photos/23230766/pexels-photo-23230766/free-photo-of-a-mercedes-benz-s-class-parked-on-the-side-of-a-street.png", description: "A high-end Mercedes-Benz S-Class for premium comfort.")
            ]
        ),
        RentalCompany(
            name: "Mooi Wheels",
            image: "https://images.pexels.com/photos/1337380/pexels-photo-1337380.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            rating: 4.2,
            cars: [
                Car(name: "SUV for Adventures", price: 100, picture: "https://images.pexels.com/photos/5086480/pexels-photo-5086480.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A spacious SUV ideal for adventurous trips."),
                Car(name: "BMW F30", price: 130, picture: "https://images.pexels.com/photos/18355421/pexels-photo-18355421/free-photo-of-black-bmw-f30.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A sleek BMW F30 for an exceptional driving experience.")
            ]
        ),
        RentalCompany(
            name: "Premium Rentals",
            image: "https://example.com/premium.jpg",
            rating: 3.8,
            cars: [
                Car(name: "Luxury Black Car", price: 120, picture: "https://images.pexels.com/photos/26954166/pexels-photo-26954166/free-photo-of-luxury-black-car-in-garage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A luxurious black car perfect for city driving."),
                Car(name: "Mercedes-Benz S-Class", price: 150, picture: "https://images.pexels.com/photos/23230766/pexels-photo-23230766/free-photo-of-a-mercedes-benz-s-class-parked-on-the-side-of-a-street.png", description: "A high-end Mercedes-Benz S-Class for premium comfort.")
            ]
        ),
        RentalCompany(
            name: "Dodge Rent",
            image: "https://images.pexels.com/photos/3767673/pexels-photo-3767673.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            rating: 2.8,
            cars: [
                Car(name: "Luxury Black Car", price: 120, picture: "https://images.pexels.com/photos/26954166/pexels-photo-26954166/free-photo-of-luxury-black-car-in-garage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A luxurious black car perfect for city driving."),
                Car(name: "Mercedes-Benz S-Class", price: 150, picture: "https://images.pexels.com/photos/23230766/pexels-photo-23230766/free-photo-of-a-mercedes-benz-s-class-parked-on-the-side-of-a-street.png", description: "A high-end Mercedes-Benz S-Class for premium comfort.")
            ]
        ),
        RentalCompany(
            name: "Luxary",
            image: "https://images.pexels.com/photos/5218003/pexels-photo-5218003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            rating: 5.0,
            cars: [
                Car(name: "Luxury Black Car", price: 120, picture: "https://images.pexels.com/photos/26954166/pexels-photo-26954166/free-photo-of-luxury-black-car-in-garage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", description: "A luxurious black car perfect for city driving."),
                Car(name: "Mercedes-Benz S-Class", price: 150, picture: "https://images.pexels.com/photos/23230766/pexels-photo-23230766/free-photo-of-a-mercedes-benz-s-class-parked-on-the-side-of-a-street.png", description: "A high-end Mercedes-Benz S-Class for premium comfort.")
            ]
        )
    ]
}

struct Car: Identifiable {
    let id = UUID()
    var name: String
    var price: Int
    var picture: String
    var description: String
}

