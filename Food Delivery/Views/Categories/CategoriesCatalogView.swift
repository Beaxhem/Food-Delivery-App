//
//  CategoriesCatalogView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct CategoriesCatalogView: View {
    var body: some View {
        
        
        VStack(spacing:0) {
                HStack( ) {
                    
                    CategoryRectView()
                        
                        
                    Spacer(minLength: 25)
                    CategoryRectView()
                        
                        
                    
                }
                
                HStack {
                    CategoryRectView()
                        
                        
                    Spacer(minLength: 25)
                    CategoryRectView()
                        
                        
                    
                    
                }
            
            }
            .padding(.vertical)
            .scaledToFill()
        
    }
}

struct CategoriesCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCatalogView()
    }
}

