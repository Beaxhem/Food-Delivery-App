//
//  GroupView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 03.10.2020.
//

import SwiftUI

struct GroupView: View {
    var group: [Product]
    var idx: Int
    
    var body: some View {
        HStack {
            if group.indices.contains(idx + 1) {
                Spacer()

                ProductCellView(product: group[idx])
                
                Spacer()
                 
                
                ProductCellView(product: group[idx + 1])
                Spacer()
                
            } else {
                ProductCellView(product: group[idx])
                    .frame(width: UIScreen.main.bounds.width / 2 - 25)
                    .padding(.leading, 7)

                Spacer()
            }
            
            
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(group: [Product.defaultProduct()], idx: 0)
    }
}
