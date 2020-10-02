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
    
    let delivery: Float = 14.2
    let fee: Float = 5.42
    @State var discount: Float = 0.0
    
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
            
            if !cart.isEmpty() {
                ScrollView {
                    VStack(spacing: 30) {
                        
                        
                        ForEach(cart.getItems()) { item in
                            CartItemView(item: item)
                        }
                        Divider()
                        
                        HStack {
                            TextField("Promo code", text: $coupon)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                processPromoCode()
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
                                Text("Products")
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(format(float: cart.totalSum()))$")
                            }
                            
                            HStack {
                                Text("Delivery")
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(format(float: delivery))$")
                            }
                            
                            HStack {
                                Text("Fee")
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(format(float: fee))$")
                            }
                            
                            HStack {
                                Text("Discount")
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(format(float: discount))$")
                                    .foregroundColor(.green)
                            }
                            
                            HStack {
                                Text("Total")
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(format(float: total()))$")
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
            } else {
                Text("Empty cart")
            }
        }
    }
    
    func processPromoCode() {
        if discount == 0.0 {
            if coupon == "MAX" {
                self.discount += cart.totalSum() * 0.05
            }
        }
        
    }
    
    func format(float: Float) -> String {
        return String(format: "%.2f", float)
    }
    func total() -> Float {
        return self.delivery + self.fee + self.cart.totalSum() - self.discount
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
