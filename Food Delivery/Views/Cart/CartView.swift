//
//  Cart.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI
import PartialSheet

struct CartView: View {
    @Binding var isOpened: Bool
    @EnvironmentObject var settings : SheetManager
    
    var body: some View {
        CartButtonView()
            .onTapGesture {
                self.settings.showPartialSheet {
                    CartListView()
                }
            }
           
            
            
            
            .shadow(color: .blue, radius: 1)
    }
}

struct CartListView: View {
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var sheetManager : SheetManager
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "multiply")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .onTapGesture {
                        withAnimation {
                            sheetManager.hideSheet()
                        }
                    }
            }
            
            ForEach(cart.items) { item in
                Text(item.product.name)
            }
            
            Spacer()
        }
        .padding()
        
    }
}

struct CartButtonView: View {
    @EnvironmentObject var cart: Cart
    
    public var body: some View {
        BadgeView(value: cart.count()) {
            Image(systemName: "bag.fill")
                .frame(width: 75, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(37.5)
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(isOpened: .constant(false))
    }
}
