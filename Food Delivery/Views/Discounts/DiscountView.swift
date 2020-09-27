//
//  DiscountView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct DiscountView: View {
    var discount: Discount
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(discount.text)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 100)
        .background(Color.init(discount.color))
        .cornerRadius(10)
        
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(discount: Discount(id: 0, text: "Test"))
    }
}
