//
//  BadgeView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 01.10.2020.
//

import SwiftUI

struct BadgeView<Content: View>: View {
    var value: Int
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                content()
                
                if value > 0 {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 30, height: 30)
                        .overlay(Text(String(value))
                                    .foregroundColor(.white)
                                )
                        .position(x: geometry.size.width - 15, y: geometry.size.height - 15)
                }
            }
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(value: 1) {
            Image(systemName: "person.fill")
        }
    }
}
