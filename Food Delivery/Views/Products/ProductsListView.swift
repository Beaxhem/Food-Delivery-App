//
//  ProductsListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct ProductsListView: View {
    @State var products: [Product] = []
    @State var groups = [String: [Product]]()
    @State var selectedCategory = ""
    
    var companyID: UUID
    
    
    var body: some View {
        Group {
            CategoryListView(categories: Array(self.groups.keys).sorted(by: > ), selected: $selectedCategory)
            
            VStack(alignment: .leading) {
                if self.selectedCategory == "" {
                    ForEach(Array(self.groups.keys).sorted(by: > ), id: \.self) { key in
                        Text(key)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ForEach(getIndices(of: groups[key]!), id: \.self) { idx in
                            GroupView(group: groups[key]!, idx: idx)
                        }.transition(.move(edge: .bottom))
                        
                    }.padding(.bottom)
                } else {
                    Text(selectedCategory)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(getIndices(of: groups[selectedCategory]!), id: \.self) { idx in
                        GroupView(group: groups[selectedCategory]!, idx: idx)
                    }
                }
                
            }.padding()
        }
        
        .onAppear(perform: {
            getProducts()
            groupProducts()
        })
    }
    
    func getIndices(of items: [Any]) -> [Int] {
        return Array(stride(from: 0, to: items.count, by: 2))
    }
    
    func getProducts() {
        DatabaseManager.shared.getProducts(id: companyID.uuidString) { (res) in
            switch res {
            case .success(let result):
                self.products = result
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func groupProducts() {
        var result: [String: [Product]] = [:]
        
        for product in products {
            if result.keys.contains(product.category) {
                result[product.category]!.append(product)
            } else {
                result[product.category] = [product]
            }
        }
        
        self.groups = result
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(companyID: UUID())
    }
}
