//
//  Discount.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import Foundation
import SwiftUI

class Discount: Identifiable {
    var id: Int
    var text: String
    var color: UIColor {
        return .random()
    }
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
