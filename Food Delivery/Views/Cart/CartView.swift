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
            .frame(width: 75, height: 75)
            .background(Color.blue)
            .cornerRadius(37.5)
            .shadow(color: .blue, radius: 1)
    }
}

struct CartListView: View {
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var partialSheet : PartialSheetManager
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "multiply")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .onTapGesture {
                        withAnimation {
                            partialSheet.closePartialSheet()
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
