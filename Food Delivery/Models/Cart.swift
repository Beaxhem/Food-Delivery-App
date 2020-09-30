//
//  Cart.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import Foundation

class Cart: ObservableObject {
    @Published var items: [CartItem]
    
    init() {
        self.items = []
    }
    
    init(items: [CartItem]) {
        self.items = items
    }
    
    func addToCart(item: Product) {
        let cartItem = CartItem(product: item)
        self.items.append(cartItem)
    }
    
    func totalSum() -> Float {
        var total: Float = 0.0
        
        for item in self.items {
            total += item.getTotalPrice()
        }
        
        return total
    }
    
    func count() -> Int {
        return self.items.reduce(0, { res, item in
            res + item.count
        })
    }
}

class CartItem: Identifiable {
    var id: UUID
    var product: Product
    var count: Int
    
    init(product: Product, count: Int = 1) {
        self.id = UUID()
        self.product = product
        self.count = count
    }
    
    func getTotalPrice() -> Float {
        return product.price * Float(count)
    }
}
