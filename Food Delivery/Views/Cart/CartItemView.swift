//
//  CartItem.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 01.10.2020.
//

import SwiftUI

struct CartItemView: View {
    @EnvironmentObject var cart: Cart
    var id: UUID
    var item: CartItem {
        return cart.items[id]!
    }
    
    var body: some View {
        HStack {
            Image(item.product.imageName)
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.product.name)
                        .bold()
                }
                
                Text(item.product.category)
                    .font(.callout)
            }
            Spacer()
            
            VStack(spacing: 10) {
                Text("Qty.")
                    .font(.caption)
                
                HStack(spacing: 0) {
                    Button(action: {
                        self.increment()
                    }) {
                        Text("+")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 35, height: 35)
                    .background(Color.gray)
                    .cornerRadius(4)
                    
                    Text("\(item.count)")
                        .font(.headline)
                        .bold()
                        .frame(width: 35)
                    
                    Button(action: {
                        self.decrement()
                    }) {
                        Text("-")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 35, height: 35)
                    .background(Color.gray)
                    .cornerRadius(4)
                    
                }
                
                Text(String(format: "%.2f", item.getTotalPrice()) + "$")
                    .font(.title2)
                    .bold()
            }
            
        }
    }
    
    func increment() {
        cart.increment(id: item.id)
    }
    
    func decrement() {
        cart.decrement(id: item.id)
    }
    
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(id: CartItem(product: Product.defaultProduct()).id)
    }
}
