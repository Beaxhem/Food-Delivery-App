//
//  CategoryView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct CategoryRectView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 70, height: 70)
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                    }
                    Text("Vegetarian")
                        .font(.system(size: 20, weight: .semibold))
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.width)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
        }
        
            
        
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRectView()
    }
}
