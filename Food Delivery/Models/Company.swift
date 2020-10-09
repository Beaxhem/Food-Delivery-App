//
//  Company.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import Foundation

class Company: Identifiable {
    var id: UUID
    var name: String
    var imageName: String
    var logoName: String
    var categories: [Category]
    
    init() {
        self.id = UUID()
        self.name = ""
        self.imageName = ""
        self.logoName = ""
        self.categories = [Category]()
    }
    
    init(name: String, imageName: String = "mcdonalds", logoName: String = "mcdonalds_logo", categories: [Category] = []) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.logoName = logoName
        self.categories = categories
    }
}

class Category: Identifiable {
    var id: UUID
    var name: String
    var iconName: String
    
    init(name: String, iconName: String) {
        self.id = UUID()
        self.name = name
        self.iconName = iconName
    }
}
