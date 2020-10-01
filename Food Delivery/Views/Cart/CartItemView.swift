//
//  CartItem.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 01.10.2020.
//

import SwiftUI

struct CartItemView: View {
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
                    
                    Text(String(item.getTotalPrice()) + "$")
                        .font(.title)
                        .bold()
                }
                
                
                Text(item.product.category)
                    .font(.callout)
            }
            Spacer()
            
            
            VStack {
                Text("Qty.")
                    .font(.caption)
                
                HStack {
                    
                    Button(action: {
                        item.count += 1
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
                    
                    Button(action: {
                        item.count -= 1
                    }) {
                        Text("-")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 35, height: 35)
                    .background(Color.gray)
                    .cornerRadius(4)
                    
                }
            }
            
        }
    }
    
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(item: CartItem(product: Product.defaultProduct()))
    }
}
