//
//  CompanyView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct CompanyView: View {
    var company: Company
    
    var body: some View {
        NavigationLink(destination: CompanyDetails(company: company)) {
            VStack(alignment: .leading) {
                Image(company.imageName)
                    .resizable()
                    .frame(height: 150)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text(company.name)
                        .font(.headline)
                    HStack {
                        HStack(spacing: 5) {
                            Image(systemName: "bookmark")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 12, height: 12)
                            Text("Lorem ipsum dolores amen")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "clock")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 12, height: 12)
                            Text("20-25 min")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                   
                    
                }
                .padding([.horizontal, .bottom])
                
            }
            .background(Color.white)
            
            .cornerRadius(10)
            .shadow(radius: 3)
        }
        
        
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView(company: Company(id: 0, name: "Test", imageName: "mcdonalds"))
    }
}
