//
//  DatabaseManager.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import Foundation
import Firebase
import FirebaseDatabase

enum DatabaseError: Error {
    case notFound(message: String)
}

class DatabaseManager {
    static let shared = DatabaseManager()
    private let db = Firestore.firestore()
    private let realTimeDB = Database.database().reference()
    
    let companies = [
        Company(name: "Test", imageName: "mcdonalds"),
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
        db.collection("companies").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                var companies: [Company] = []
                
                for doc in querySnapshot!.documents {
                    let company = Company.from(dict: doc.data(), documentID: doc.documentID)
                    companies.append(company)
                }
                
                completion(.success(companies))
            }
        }
        
    }
    
    func getProducts(id: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        completion(.success(products))
    }
    
    func getDiscounts(completion: @escaping((Result<[Discount], Error>) -> Void)) {
        completion(.success(discounts))
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
}

extension DatabaseManager {
    func getOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        var orders = [Order]()
        realTimeDB.child("orders").observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else {
                completion(.failure(DatabaseError.notFound(message: "Not found")))
                return
            }
            
            let ids = value.allKeys as! [String]
            
            for id in ids {
                let document = value.value(forKey: id) as! [String: Any]
                let order = Order.from(dict: document, documentID: id)

                orders.append(order)
            }
            completion(.success(orders))

        }
    }
    
    func createOrder(order: Order, completion: @escaping (Error?) -> Void) {
        guard let data = order.getDict() else {
            return
        }
        realTimeDB.child("orders").child("\(order.id)").setValue(data) { err, ref in
            if let err = err {
                print(err)
                completion(err)
            } else {
                print("Order created")
                completion(nil)
            }
        }
    }
    
    func removeOrderBy(documentID: String, completion: @escaping (Error?) -> Void) {
        realTimeDB.child("orders").child(documentID).setValue(nil)
    }
}

extension DatabaseManager {
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
                let data = document?.data() as! [String: String]
                let user = Customer.from(dict: data)
                completion(.success(user))
            }
        }
    }
}
