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
    
    @State var coupon: String = ""
    
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
            .offset(y: -15)
            ScrollView {
                VStack(spacing: 30) {
                    
                    
                    ForEach(cart.getItems()) { item in
                        CartItemView(id: item.id)
                    }
                    Divider()
                    
                    HStack {
                        TextField("Promo code", text: $coupon)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            
                        }) {
                            Text("Apply")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .cornerRadius(7)
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [3.5]))
                            .fill(Color.gray)
                            .frame(height: 1)
                        
                        HStack {
                            Text("Delivery")
                                .bold()
                            
                            Spacer()
                            
                            Text("9.0$")
                        }
                        
                        HStack {
                            Text("Fee")
                                .bold()
                            
                            Spacer()
                            
                            Text("0.9$")
                        }
                        
                        HStack {
                            Text("Total")
                                .bold()
                            
                            Spacer()
                            
                            Text("99.0$")
                        }
                        
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [3.5]))
                            .fill(Color.gray)
                            .frame(height: 1)
                    }
                    .padding(8)
                    .background(Color.white)
                    .shadow(radius: 3)
                    
                    Button(action: {
                            
                        }) {
                            Text("Checkout")
                                .foregroundColor(.white)
                                .bold()
                                .frame(minWidth: 0,
                                                maxWidth: .infinity)
                        }
                        .padding(.vertical, 20)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                                        
                    
                    Spacer()
                }
                .padding()
            }
        }
        
        
        
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
