//
//  Product.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import Foundation

class Product: Identifiable, Encodable {
    var id: UUID
    var name: String
    var price: Float
    var imageName: String
    var category: String
    
    init(name: String, price: Float, category: String, imageName: String) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.imageName = imageName
        self.category = category
    }
    
    init() {
        self.id = UUID()
        self.name = ""
        self.price = 0.0
        self.imageName = ""
        self.category = ""
    }
    
    static func from(dict: [String: Any]) -> Product {
        let product = Product()
        
        product.category = dict["category"] as! String
        product.imageName = dict["imageName"] as! String
        product.name = dict["name"] as! String
        product.price = dict["price"] as! Float
        
        return product
    }
    static func defaultProduct() -> Product {
        let product = Product()
        
        product.category = "Test category"
        product.imageName = "mcdonalds"
        product.name = "Test name"
        product.price = 99.7
        
        return product
    }
}
