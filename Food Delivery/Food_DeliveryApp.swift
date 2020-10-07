//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI
import PartialSheet
import Firebase

@main
struct Food_DeliveryApp: App {
    
    var cart = Cart()
    var sheetManager = PartialSheetManager()
    var settings = SheetManager()
    var tabController = TabController()
    var hudController = HUDController()
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sheetManager)
                .environmentObject(settings.setManager(manager: sheetManager))
                .environmentObject(cart)
                .environmentObject(tabController)
                .environmentObject(hudController)
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
