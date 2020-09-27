//
//  Color.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import Foundation
import SwiftUI

extension UIColor {
    static func random() -> UIColor {
            return UIColor(
               red:   .random(),
               green: .random(),
               blue:  .random(),
               alpha: 1.0
            )
        }
}
