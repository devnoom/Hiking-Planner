//
//  DataManager.swift
//  Hiking Planner
//
//  Created by MacBook Air on 21.07.24.
//

import Foundation
import Networking

// MARK: - Data Manager
final class DataManager {
    
    // MARK: - Shared Instance
    static let shared = DataManager()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Fetch All Data
    func fetchAllData(completion: @escaping (Result<AppData, Error>) -> Void) {
        guard let url = URL(string: "https://mocki.io/v1/65ac9f09-ff3b-46ab-8f07-e39ddcbbe177") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        NetworkingService.shared.fetchData(from: url) { (result: Result<AppData, Error>) in
            completion(result)
        }
    }
}
