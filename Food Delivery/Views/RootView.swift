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
    
    let sheetStyle = PartialSheetStyle(background: .blur(.systemMaterialDark),
                                           handlerBarColor: Color(UIColor.systemGray2),
                                           enableCover: true,
                                           coverColor: Color.black.opacity(0.4),
                                           blurEffectStyle: nil,
                                           cornerRadius: 10,
                                           minTopDistance: 300
        )
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            CompaniesView()
                .tabItem {
                    Image(systemName: "house.fill")
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
        .addPartialSheet(style: self.sheetStyle)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
