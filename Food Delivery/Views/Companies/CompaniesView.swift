//
//  CompaniesListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI

struct CompaniesView: View {
    @State var searchText = ""
    
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    SearchFieldView(text: $searchText, typing: self.$isSearching, placeholderText: "What do you want to eat?")
                        
                    if self.isSearching {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .bottom) {
                                    Text("Categories")
                                        .font(.system(size: 20, weight: .semibold))
    
                                    Spacer()
                                    NavigationLink(destination: CompaniesView()) {
                                        Text("View all").foregroundColor(.blue)
                                    }
                            }
    
                            CategoriesCatalogView()
                        }.padding(.top)
                    } else {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .bottom) {
                                    Text("Discounts")
                                        .font(.system(size: 20, weight: .semibold))
                                        
                                    Spacer()
                                    NavigationLink(destination: CompaniesView()) {
                                        Text("View all").foregroundColor(.blue)
                                    }
                            }
                            DiscountsListView()
                        }.padding(.top)
                        
                     
                        
                            
                        VStack(alignment: .leading, spacing: 0) {
                         
                            HStack(alignment: .bottom) {
                                    Text("Companies")
                                        .font(.system(size: 20, weight: .semibold))
                                        
                                    Spacer()
                                    NavigationLink(destination: CompaniesView()) {
                                        Text("View all").foregroundColor(.blue)
                                    }
                            }
       
                            CompaniesListView()
                        }
                    }
                    
                    
                    Spacer()
                }.padding()
                
            }
            .navigationTitle("Browse")

        }
        
    }
}

struct CompaniesView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
