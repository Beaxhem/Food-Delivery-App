//
//  CategoryRoundedView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct CategoryRoundedView: View {
    var selected: Bool
    
    var body: some View {
        
        HStack {
            
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .frame(width: 40, height: 40)
                Image(systemName: "leaf.fill")
                    .foregroundColor(self.selected ? .white : .green)
            }
            Text("Vegetarian")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(selected ? .white : .black)
        }
        .padding(5)
        .background(self.selected ? Color.green : Color.white)
        .cornerRadius(17)
        .shadow(radius: 3)
    }
}

struct CategoryRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRoundedView(selected: false)
    }
}
