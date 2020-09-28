//
//  NavigationView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 28.09.2020.
//

import Foundation
import SwiftUI

extension UINavigationController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topViewController?.hidesBottomBarWhenPushed = true
    }
}
