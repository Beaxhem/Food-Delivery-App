//
//  ProductCellView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI
import PartialSheet

struct ProductCellView: View {
    var product: Product
    
    @EnvironmentObject var settings : SheetManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(product.imageName)
                .resizable()
                .frame(height: 100)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .bold()
                Text(String(product.price)+"$")
            }
            .padding()
        }
        .onTapGesture {
            
            self.settings.showPartialSheet(style: addToCartSheetStyle) {
                ProductActionView(product: product, callback: {
                    addToCart()
                })
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
    
    func addToCart() {
        
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(name: "Test", price: 99.8, category: "Test", imageName: "mcdonalds"))
    }
}
