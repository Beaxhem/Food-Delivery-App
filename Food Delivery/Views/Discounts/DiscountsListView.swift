//
//  DiscountsListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct DiscountsListView: View {
    @State var discounts: [Discount] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(discounts) { discount in
                    DiscountView(discount: discount)
                }
            }
            .padding(.vertical)
        }
        .onAppear(perform: getDiscounts)
    }
    
    func getDiscounts() {
        DatabaseManager.shared.getDiscounts { (res) in
            switch res {
            case .success(let result):
                discounts = result
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct DiscountsListView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountsListView()
    }
}
