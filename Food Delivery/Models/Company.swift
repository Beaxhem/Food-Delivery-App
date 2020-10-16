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
    
    init() {
        self.id = UUID()
        self.name = ""
        self.imageName = ""
        self.logoName = ""
    }
    
    init(name: String, imageName: String = "mcdonalds", logoName: String = "mcdonalds_logo") {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.logoName = logoName    
    }
    
    static func from(dict: [String: Any], documentID: String) -> Company {
        let company = Company()
        
        company.id = UUID(uuidString: documentID)!
        company.name = dict["name"] as! String
        company.imageName = dict["imageName"] as! String
        company.logoName = dict["logoName"] as! String
        
        return company
    }
}

class Category: Identifiable {
    var id: UUID
    var name: String
    var iconName: String
    
    init() {
        self.id = UUID()
        self.name = ""
        self.iconName = ""
    }
    
    init(name: String, iconName: String) {
        self.id = UUID()
        self.name = name
        self.iconName = iconName
    }
    
    static func from(dict: [String: Any]) -> Category {
        let category = Category()
        
        category.iconName = dict["iconName"] as! String
        category.name = dict["name"] as! String
        
        return category
    }
}
