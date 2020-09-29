//
//  Cart.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI

struct CartView: View {
    @Binding var isOpened: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isOpened {
                     Text("Hello")
                    
                } else {
                    CartButtonView()
                }
                
            }
            .onTapGesture {
                withAnimation {
                    isOpened.toggle()
                }
                
            }
            .frame(width: isOpened ? geometry.size.width : 75, height: isOpened ? geometry.size.height : 75)
            .background(Color.blue)
            .cornerRadius(isOpened ? 15 : 25, corners: isOpened ? [.topLeft, .topRight] : .allCorners )
            .shadow(color: .blue, radius: 1)
        }
        
    }
}

struct CartButtonView: View {
    public var body: some View {
        ZStack {
            Image(systemName: "bag.fill")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(isOpened: .constant(false))
    }
}
