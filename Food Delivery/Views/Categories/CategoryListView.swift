//
//  CategoryListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct CategoryListView: View {
    @Binding var selected: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer(minLength: 5)
                ForEach(0..<4) { i in
                    CategoryRoundedView(selected: selected == i)
                        .onTapGesture {
                            if selected == i {
                                selected = -1
                            } else {
                                self.selected = i
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
        CategoryListView(selected: .constant(0))
    }
}
