//
//  OrdersListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 06.10.2020.
//

import SwiftUI

struct OrdersListView: View {
    var orders: [Order]
    
    
    
    var body: some View {
        ForEach(self.orders) { order in
            OrderCellView(order: order)
        }
        
    }
    
    
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(orders: [Order()])
    }
}
