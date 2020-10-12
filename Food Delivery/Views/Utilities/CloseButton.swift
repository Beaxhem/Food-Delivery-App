//
//  CloseButton.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 12.10.2020.
//

import SwiftUI

struct CloseButton: View {
    var onTap: () -> Void
    var style: ColorScheme = .light
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "multiply")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(style == .dark ? .white : .black)
                .padding()
                .onTapGesture {
                    withAnimation {
                        onTap()
                    }
                }
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(onTap: {})
    }
}
