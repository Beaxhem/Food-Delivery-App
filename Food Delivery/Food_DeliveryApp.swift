//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI
import PartialSheet

@main
struct Food_DeliveryApp: App {
    var cart = Cart()
    var sheetManager = PartialSheetManager()
    var settings = SheetManager()
    
    var body: some Scene {
        WindowGroup {
            
            RootView()
                .environmentObject(sheetManager)
                .environmentObject(settings.setManager(manager: sheetManager))
                
                .environmentObject(cart)
        }
    }
}
