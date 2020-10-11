//
//  TextStyle.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 12.10.2020.
//

import SwiftUI

struct BigButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: .zero, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.headline)
    }
}
