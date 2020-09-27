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
    
    init(name: String, imageName: String) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
    }
}
