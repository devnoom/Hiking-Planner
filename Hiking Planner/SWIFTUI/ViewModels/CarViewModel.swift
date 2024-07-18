//
//  CarViewModel.swift
//  Hiking Planner
//
//  Created by MacBook Air on 09.07.24.
//

import Foundation
import Combine

class CarViewModel: ObservableObject {
    @Published var cars: [Car] = []

//    init() {
//        self.cars = [
//            Car(
//                name: "Luxury Black Car",
//                price: 120,
//                picture: "https://images.pexels.com/photos/26954166/pexels-photo-26954166/free-photo-of-luxury-black-car-in-garage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A luxurious black car perfect for city driving."
//            ),
//            Car(
//                name: "Mercedes-Benz S-Class",
//                price: 150,
//                picture: "https://images.pexels.com/photos/23230766/pexels-photo-23230766/free-photo-of-a-mercedes-benz-s-class-parked-on-the-side-of-a-street.png",
//                description: "A high-end Mercedes-Benz S-Class for premium comfort."
//            ),
//            Car(
//                name: "SUV for Adventures",
//                price: 100,
//                picture: "https://images.pexels.com/photos/5086480/pexels-photo-5086480.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A spacious SUV ideal for adventurous trips."
//            ),
//            Car(
//                name: "BMW F30",
//                price: 130,
//                picture: "https://images.pexels.com/photos/18355421/pexels-photo-18355421/free-photo-of-black-bmw-f30.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A sleek BMW F30 for an exceptional driving experience."
//            ),
//            Car(
//                name: "Mercedes C-Class",
//                price: 140,
//                picture: "https://images.pexels.com/photos/18318569/pexels-photo-18318569/free-photo-of-white-mercedes-c-class.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A stylish white Mercedes C-Class for luxurious rides."
//            ),
//            Car(
//                name: "Classic Car",
//                price: 90,
//                picture: "https://images.pexels.com/photos/909907/pexels-photo-909907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A classic car that combines vintage looks with modern performance."
//            ),
//            Car(
//                name: "Sports Car",
//                price: 200,
//                picture: "https://images.pexels.com/photos/1035108/pexels-photo-1035108.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A high-performance sports car for speed enthusiasts."
//            ),
//            Car(
//                name: "Volvo XC60",
//                price: 110,
//                picture: "https://images.pexels.com/photos/20695262/pexels-photo-20695262/free-photo-of-volvo-xc60-on-dirt-road-in-winter.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A reliable Volvo XC60 for comfortable and safe journeys."
//            ),
//            Car(
//                name: "Modern Sedan",
//                price: 80,
//                picture: "https://images.pexels.com/photos/10017333/pexels-photo-10017333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A modern sedan offering a smooth and efficient drive."
//            ),
//            Car(
//                name: "Family Van",
//                price: 110,
//                picture: "https://images.pexels.com/photos/10748350/pexels-photo-10748350.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                description: "A spacious family van perfect for long road trips."
//            )
//        ]
//    }
}

