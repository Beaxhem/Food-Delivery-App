//
//  DatabaseManager.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import Foundation
import Firebase

enum DatabaseError: Error {
    case notFound(message: String)
}

class DatabaseManager {
    static let shared = DatabaseManager()
    private let db = Firestore.firestore()
    
    let companies = [
        Company(name: "McDonalds", imageName: "mcdonalds"),
        Company(name: "McDonalds", imageName: "mcdonalds"),
        Company(name: "McDonalds", imageName: "mcdonalds"),
        Company(name: "McDonalds", imageName: "mcdonalds"),
    ]
    
    let products = [
        Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
        Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
        Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
        Product(name: "Mac menu", price: 99.9, category: "Menu", imageName: "mcdonalds"),
        Product(name: "Mac menu", price: 99.9, category: "Test category", imageName: "mcdonalds"),
    ]
    
    let discounts = [
        Discount(id: 0, text: "50% off"),
        Discount(id: 0, text: "50% off"),
        Discount(id: 0, text: "50% off"),
    ]
    
    func getCompanies(completion: @escaping((Result<[Company], Error>) -> Void)) {
        completion(.success(companies))
    }
    
    func getProducts(id: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        completion(.success(products))
    }
    
    func getDiscounts(completion: @escaping((Result<[Discount], Error>) -> Void)) {
        completion(.success(discounts))
    }

    func createOrder(order: Order, completion: @escaping (Error?) -> Void) {
        var ref: DocumentReference? = nil
        
        guard let data = order.getDict() else {
            return
        }
        
        ref = db.collection("orders").addDocument(data: data) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(err)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                completion(nil)
            }
        }
    }
    
    func getCompanyByName(_ name: String, completion: @escaping (Result<Company, Error>) -> Void) {
        for company in companies {
            if company.name == name {
                completion(.success(company))
                
                return
            }
        }
        
        completion(.failure(DatabaseError.notFound(message: "Company with a name '\(name)' has not been found")))
    }
    
    func getOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        var orders = [Order]()
        db.collection("orders").getDocuments { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {
                return
            }
            
            for document in querySnapshot.documents {
                let order = Order.from(dict: document.data())
                
                orders.append(order)
            }
            completion(.success(orders))
        }
        
    }
    
    func createUser(user: Customer, completion: @escaping (Error?) -> Void) {
        guard let data = user.getDict() else {
            return
        }
        
        db.collection("users").document(user.email).setData(data, completion: completion)
    }
    
    func getUser(email: String, completion: @escaping (Result<Customer, Error>) -> Void) {
        db.collection("users").document(email).getDocument { (document, error) in
            if let error = error {
                print(error)
            } else {
                let data = document?.data() as [String: String]
                let user = Customer.from(dict: data)
                completion(.success(user))
            }
        }
    }
}
