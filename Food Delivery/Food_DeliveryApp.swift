//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI

@main
struct Food_DeliveryApp: App {
    var cart = Cart()
    
    var body: some Scene {
        WindowGroup {
            
            RootView()
                .environmentObject(CustomPartialSheetManager())
                .environmentObject(cart)
        }
    }
}
