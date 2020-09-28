//
//  Product.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import Foundation

class Product: Identifiable {
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
}
