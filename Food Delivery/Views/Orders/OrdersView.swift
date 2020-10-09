//
//  OrdersView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 06.10.2020.
//

import SwiftUI

struct OrdersView: View {
    @State var searchText: String = ""
    @State var isSearching = false
    @State var orders = [Order]()
    @State var loadingState: LoadingState = .loading
    
    var body: some View {
        LoadingView(state: loadingState) {
            NavigationView {
                ScrollView {
                    VStack {
                        SearchFieldView(text: $searchText, typing: self.$isSearching, placeholderText: "Search")
                        OrdersListView(orders: self.orders)
                    }.padding()
                }
                
                .navigationTitle("My orders")
            }
            
        }
        .onAppear(perform: getOrders)
        
    }
    
    func getOrders() {
        DatabaseManager.shared.getOrders { res in
            switch res {
            case .failure(let error):
                self.loadingState = .cancel
                print(error)
            case .success(let orders):
                self.loadingState = .done
                self.orders = orders
            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
