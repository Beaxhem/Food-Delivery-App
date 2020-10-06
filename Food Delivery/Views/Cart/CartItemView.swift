//
//  CartItem.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 01.10.2020.
//

import SwiftUI

struct CartItemView: View {
    @EnvironmentObject var cart: Cart
    var item: CartItem
    
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
            
            Image(systemName: "multiply")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.gray)
                .padding(10)
                .onTapGesture {
                    deleteFromCart()
                }
        }
    }
    
    func deleteFromCart() {
        saveChangesToCart {
            withAnimation {
                cart.deleteFromCart(id: item.id)
            }
        }
    }
    
    func increment() {
        saveChangesToCart {
            self.cart.increment(id: item.id)
        }
    }
    
    func decrement() {
        saveChangesToCart {
            self.cart.decrement(id: item.id)
        }
    }
    
    func saveChangesToCart(fun: () -> Void) {
        fun()
        self.cart.items = cart.items
    }
    
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(item: CartItem(product: Product.defaultProduct()))
    }
}
