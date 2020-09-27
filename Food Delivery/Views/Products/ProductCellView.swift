//
//  ProductCellView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct ProductCellView: View {
    var product: Product
    
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
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(name: "Test", price: 99.8, category: "Test", imageName: "mcdonalds"))
    }
}
