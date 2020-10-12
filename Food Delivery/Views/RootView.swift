//
//  RootView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI
import PartialSheet

struct RootView: View {
    @EnvironmentObject var tabController: TabController
    @EnvironmentObject var settings: SheetManager
    @EnvironmentObject var hudController: HUDController
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @ObservedObject var auth = AuthenticationState()
    
    init() {
        UITabBar.appearance().barTintColor  = UIColor.white
    }
    
    var body: some View {        
        ProgressHUDView(isShowing: $hudController.isShowing, text: hudController.text, afterDelay: hudController.delay) {
            TabView(selection: $tabController.selectedIndex) {
                CompaniesView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Restaurants")
                    }
                    .tag(0)
                MapRoute()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .tag(1)
                
                OrdersView()
                    .tabItem {
                        Image(systemName: "heart.text.square")
                        Text("Orders")
                    }
                    .tag(2)
                SettingsView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .environmentObject(auth)
            .accentColor(.black)
            .background(Color.white)
            .addPartialSheet(style: settings.style)
            .fullScreenCover(isPresented: $auth.isNotLoggedIn) {
                RegisterPageView()
                    .environmentObject(auth)
            }
            
        }
        
        
        
        
        
    }
}

class TabController: ObservableObject {
    @Published var selectedIndex = 0
    
    func setTab(index: Int) {
        self.selectedIndex = index
        print(self.selectedIndex)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
