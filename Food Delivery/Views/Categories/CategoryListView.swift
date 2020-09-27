//
//  CategoryListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct CategoryListView: View {
    var categories: [String] 
    @Binding var selected: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer(minLength: 5)
                ForEach(categories, id: \.self) { category in
                    CategoryRoundedView(category: category, selected: selected == category)
                        .onTapGesture {
                            if selected == category{
                                selected = ""
                            } else {
                                self.selected = category
                            }
                        }
                }
                Spacer(minLength: 5)
            }
            .padding(.vertical)
            
        }
        
        
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categories: ["test"], selected: .constant(""))
    }
}
