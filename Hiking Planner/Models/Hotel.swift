//
//  Flight.swift
//  Hiking Planner
//
//  Created by MacBook Air on 23.06.24.
//

import Foundation

struct Hotel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
    let rating: Double
    let rooms: [Room]
}

struct Room: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let picture: String
    let description: String
}



import Foundation

struct SampleData {
    static let hotels: [Hotel] = [
        Hotel(name: "Hotel California", description: "A lovely place", image: "https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", rating: 4.5, rooms: [
            Room(name: "Room 1", price: 120.0, picture: "https://example.com/room1.jpg", description: "A comfortable room"),
            Room(name: "Room 2", price: 150.0, picture: "https://example.com/room2.jpg", description: "A luxurious room")
        ]),
        Hotel(name: "San Francisco Hotel", description: "Near the Golden Gate", image: "https://images.pexels.com/photos/23339923/pexels-photo-23339923/free-photo-of-hyatt-house-hotel-in-manchester.jpeg?auto=compress&cs=tinysrgb&w=800", rating: 4.2, rooms: [
            Room(name: "Room 3", price: 100.0, picture: "https://example.com/room3.jpg", description: "A cozy room"),
            Room(name: "Room 4", price: 130.0, picture: "https://example.com/room4.jpg", description: "A spacious room")
        ]),
        Hotel(name: "NYC Hotel", description: "In the heart of NYC", image: "https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg?auto=compress&cs=tinysrgb&w=800", rating: 4.8, rooms: [
            Room(name: "Room 5", price: 200.0, picture: "https://example.com/room5.jpg", description: "A premium room"),
            Room(name: "Room 6", price: 180.0, picture: "https://example.com/room6.jpg", description: "A stylish room")
        ]),
        Hotel(name: "Brooklyn Hotel", description: "Cozy and comfortable", image: "https://example.com/hotel4.jpg", rating: 4.3, rooms: [
            Room(name: "Room 7", price: 140.0, picture: "https://example.com/room7.jpg", description: "A modern room"),
            Room(name: "Room 8", price: 160.0, picture: "https://example.com/room8.jpg", description: "A deluxe room")
        ]),
        Hotel(name: "Las Vegas Hotel", description: "Bright lights and excitement", image: "https://example.com/hotel5.jpg", rating: 4.7, rooms: [
            Room(name: "Room 9", price: 220.0, picture: "https://example.com/room9.jpg", description: "A luxury suite"),
            Room(name: "Room 10", price: 180.0, picture: "https://example.com/room10.jpg", description: "A high-roller room")
        ]),
        // Additional Hotels
        Hotel(name: "Chicago Hotel", description: "In the heart of the city", image: "https://example.com/hotel6.jpg", rating: 4.1, rooms: [
            Room(name: "Room 11", price: 170.0, picture: "https://example.com/room11.jpg", description: "A spacious room"),
            Room(name: "Room 12", price: 150.0, picture: "https://example.com/room12.jpg", description: "A modern room")
        ]),
        Hotel(name: "Miami Beach Hotel", description: "Sunny and beautiful", image: "https://example.com/hotel7.jpg", rating: 4.6, rooms: [
            Room(name: "Room 13", price: 180.0, picture: "https://example.com/room13.jpg", description: "A beach view room"),
            Room(name: "Room 14", price: 160.0, picture: "https://example.com/room14.jpg", description: "A luxurious room")
        ]),
        Hotel(name: "Boston Harbor Hotel", description: "Overlooking the harbor", image: "https://example.com/hotel8.jpg", rating: 4.4, rooms: [
            Room(name: "Room 15", price: 190.0, picture: "https://example.com/room15.jpg", description: "A harbor view room"),
            Room(name: "Room 16", price: 170.0, picture: "https://example.com/room16.jpg", description: "A modern room")
        ]),
        Hotel(name: "Seattle Sky Hotel", description: "Views of the skyline", image: "https://example.com/hotel9.jpg", rating: 4.3, rooms: [
            Room(name: "Room 17", price: 210.0, picture: "https://example.com/room17.jpg", description: "A skyline view room"),
            Room(name: "Room 18", price: 190.0, picture: "https://example.com/room18.jpg", description: "A stylish room")
        ]),
        Hotel(name: "Denver Mountain Hotel", description: "Near the mountains", image: "https://example.com/hotel10.jpg", rating: 4.5, rooms: [
            Room(name: "Room 19", price: 200.0, picture: "https://example.com/room19.jpg", description: "A mountain view room"),
            Room(name: "Room 20", price: 180.0, picture: "https://example.com/room20.jpg", description: "A deluxe room")
        ]),
        Hotel(name: "Austin City Hotel", description: "In the heart of Austin", image: "https://example.com/hotel11.jpg", rating: 4.7, rooms: [
            Room(name: "Room 21", price: 160.0, picture: "https://example.com/room21.jpg", description: "A comfortable room"),
            Room(name: "Room 22", price: 140.0, picture: "https://example.com/room22.jpg", description: "A modern room")
        ]),
        Hotel(name: "Orlando Resort Hotel", description: "Close to attractions", image: "https://example.com/hotel12.jpg", rating: 4.6, rooms: [
            Room(name: "Room 23", price: 220.0, picture: "https://example.com/room23.jpg", description: "A resort view room"),
            Room(name: "Room 24", price: 200.0, picture: "https://example.com/room24.jpg", description: "A spacious room")
        ]),
        Hotel(name: "New Orleans Hotel", description: "In the French Quarter", image: "https://example.com/hotel13.jpg", rating: 4.4, rooms: [
            Room(name: "Room 25", price: 180.0, picture: "https://example.com/room25.jpg", description: "A French Quarter view room"),
            Room(name: "Room 26", price: 160.0, picture: "https://example.com/room26.jpg", description: "A modern room")
        ]),
        Hotel(name: "Atlanta Downtown Hotel", description: "In downtown Atlanta", image: "https://example.com/hotel14.jpg", rating: 4.5, rooms: [
            Room(name: "Room 27", price: 170.0, picture: "https://example.com/room27.jpg", description: "A city view room"),
            Room(name: "Room 28", price: 150.0, picture: "https://example.com/room28.jpg", description: "A comfortable room")
        ]),
        Hotel(name: "Portland Riverside Hotel", description: "Near the river", image: "https://example.com/hotel15.jpg", rating: 4.6, rooms: [
            Room(name: "Room 29", price: 210.0, picture: "https://example.com/room29.jpg", description: "A riverside view room"),
            Room(name: "Room 30", price: 190.0, picture: "https://example.com/room30.jpg", description: "A deluxe room")
        ])
    ]
}

