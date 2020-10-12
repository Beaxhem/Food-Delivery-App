//
//  CompanyShortDetails.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 12.10.2020.
//

import SwiftUI

struct CompanyShortDetails: View {
    @EnvironmentObject var sheetManager: SheetManager
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @Binding var isActive: Bool
    
    var company: Company
    
    var body: some View {
        VStack {
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
                .frame(width: UIScreen.screenWidth * 0.8)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .alignmentGuide(.bottom) { d in d[.bottom] / 2 }
            }
            
            Text("Go to the restaurant")
                .modifier(BigButtonStyle())
                .padding()
                .onTapGesture {
                    sheetManager.hideSheet()
                    isActive.toggle()
                }
        }
    }
}

struct CompanyShortDetails_Previews: PreviewProvider {
    static var previews: some View {
        CompanyShortDetails(isActive: .constant(false), company: Company())
    }
}
