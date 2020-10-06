//
//  CompanyDetails.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct CompanyDetails: View {
    var company: Company
    
    @State var isCartOpened = false
    @State var showAlertView = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .bottom) {
                            Image(company.imageName)
                                .resizable()
                                .frame(height: 250)
                                .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(company.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    RatingView(rating: 4.7)
                                }
                                
                                Text("1231 St.,San Francisco, LA")
                                    .font(.callout)
                                    .foregroundColor(.black)
                            }
                            .frame(width: geometry.size.width * 0.8)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .alignmentGuide(.bottom) { d in d[.bottom] / 2 }
                        }
                        ProductsListView(companyID: company.id)
                        
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.top)
            
            GeometryReader { geometry in
                VStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10, height: 15)
                        .font(.system(size: 15, weight: .bold))
                }
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(25)
                .position(x: 35, y: 25)
                .onTapGesture {
                    onLeave()
                }
            }
            
            GeometryReader { geometry in
                CartView(isOpened: $isCartOpened)
                    .transition(.slide)
                    .frame(width: isCartOpened ? geometry.size.width : 75, height: isCartOpened ? geometry.size.height - 30 : 75)
                    .position(x: isCartOpened ? geometry.size.width / 2 : geometry.size.width - 50, y : isCartOpened ? geometry.size.height / 2 + 15: geometry.size.height - 50)
                
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear {
            cart.source = company.name
        }
        .alert(isPresented: $showAlertView) {
            Alert(title: Text("Are you sure you want to leave?"), message: Text("You will lose your cart items"),primaryButton: .cancel(Text("Ok"), action: {
                leave()
            }), secondaryButton: .default(Text("Leave here")))
        }
        
    }
    
    func onLeave() {
        if cart.count() > 0 {
            showAlertView = true
            
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func leave() {
        cart.items = [:]
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct CompanyDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompanyDetails(company: Company(name: "test", imageName: "mcdonalds"))
        }
    }
}
