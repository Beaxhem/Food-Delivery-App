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
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ZStack() {
                    
                        Image(company.imageName)
                            .resizable()
                            .frame(height: 250)
                            .blur(radius: 0)
                        
                        Rectangle()
                            .frame(height: 250)
                            .background(Color.gray.opacity(0.01))
                            .opacity(0.2)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(company.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("1231 St.,San Francisco, LA")
                                .font(.callout)
                                .foregroundColor(.white)
                            
                            RatingView(rating: 4.7)
                            
                        }.position(x: 220, y: 195)
                    
                        
                    }
                    ProductsListView(companyID: company.id)
                    
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.top)
            
            GeometryReader { geometry in
                CartView(isOpened: $isCartOpened)
                    .transition(.slide)
                    .frame(width: isCartOpened ? geometry.size.width : 75, height: isCartOpened ? geometry.size.height - 30 : 75)
                    .position(x: isCartOpened ? geometry.size.width / 2 : geometry.size.width - 50, y : isCartOpened ? geometry.size.height / 2 + 15: geometry.size.height - 50)
                
            }
            
        }
        

        
    }
            
}

struct CompanyDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompanyDetails(company: Company(name: "test", imageName: "mcdonalds"))
        }
    }
}
