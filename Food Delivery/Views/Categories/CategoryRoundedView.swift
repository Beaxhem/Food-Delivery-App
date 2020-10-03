//
//  CategoryRoundedView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct CategoryRoundedView: View {
    var category: String
    var selected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "leaf.fill")
                .foregroundColor(self.selected ? .white : .green)
                .font(.title2)
                .padding()
                .background(self.selected ? Color.green : Color.white)
                .cornerRadius(100)
                .shadow(radius: 3)
            
            Text(category)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.black)
        }
        
        
        
        
    }
}

struct CategoryRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRoundedView(category: "Test", selected: false)
    }
}
