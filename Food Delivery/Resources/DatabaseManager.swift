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
            Company(name: "McDonalds", imageName: "mcdonalds"),
            Company(name: "McDonalds", imageName: "mcdonalds"),
            Company(name: "McDonalds", imageName: "mcdonalds"),
            Company(name: "McDonalds", imageName: "mcdonalds"),
        ]
        
        completion(.success(companies))
    }
    
    func getProducts(id: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        let products = [
            Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
            Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
            Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
            Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
            Product(name: "Mac menu", price: 99.9, category: "Test category", imageName: "mcdonalds"),
        ]
        
        completion(.success(products))
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
