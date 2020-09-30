//
//  RootView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI
import PartialSheet

struct RootView: View {
    @State private var selectedIndex: Int = 0
    
    init() {
        UITabBar.appearance().barTintColor  = UIColor.white
    }
    
    @EnvironmentObject var settings: SheetManager
    
    var body: some View {
    
        TabView(selection: $selectedIndex) {
            CompaniesView()
                .tabItem {
                    Image(systemName: "figure.wave")
                    Text("Order")
                }
                .tag(0)
                
            CompaniesView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("On map")
                }
                .tag(0)
            CompaniesView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(0)
        }
        .accentColor(.black)
        .background(Color.white)
        .addPartialSheet(style: settings.style)        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
