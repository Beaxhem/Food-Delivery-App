//
//  CGFloat.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import Foundation
import SwiftUI

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
