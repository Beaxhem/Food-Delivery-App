//
//  ProductActionView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 28.09.2020.
//

import SwiftUI

enum Options: String {
    case extraSauce = "Extra sauce"
    case vegan = "Vegan"
}
public struct ProductActionView: View {
    var product: Product
    var callback: () -> Void
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(product.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
            
                Text(product.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                
                Text(String(product.price) + "$")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            
            CheckboxField(id: Options.extraSauce.rawValue, label: Options.extraSauce.rawValue, size: 20, color: .white, callback: checkboxHandler)
            CheckboxField(id: Options.vegan.rawValue, label: Options.vegan.rawValue, size: 20, color: .white, callback: checkboxHandler)
            
            HStack {
                Text("Total: ")
                    .font(.title2)
                    .foregroundColor(.white)
                Text(String(product.price) + "$")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    callback()
                }) {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            }.padding(.top)
            
            
            
            
        }.padding()
    }
    
    func checkboxHandler(id: String, isMarked: Bool) {
        
    }
}

