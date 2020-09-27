//
//  DatabaseManager.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    
    func getCompanies(completion: @escaping((Result<[Company], Error>) -> Void)) {
        let companies = [
            Company(id: 0, name: "McDonalds", imageName: "mcdonalds"),
            Company(id: 0, name: "McDonalds", imageName: "mcdonalds"),
            Company(id: 0, name: "McDonalds", imageName: "mcdonalds"),
            Company(id: 0, name: "McDonalds", imageName: "mcdonalds"),
        ]
        
        completion(.success(companies))
    }
    
    func getDiscounts(completion: @escaping((Result<[Discount], Error>) -> Void)) {
        let discounts = [
            Discount(id: 0, text: "50% off"),
            Discount(id: 0, text: "50% off"),
            Discount(id: 0, text: "50% off"),
        ]
        
        completion(.success(discounts))
    }
}
