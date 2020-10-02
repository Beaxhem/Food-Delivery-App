//
//  Cart.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI

class Cart: ObservableObject {
    @Published var items: [UUID: CartItem]
    
    init() {
        self.items = [:]
    }
    
    init(items: [UUID: CartItem]) {
        self.items = items
    }
    
    func getItems() -> [CartItem] {
        return Array(self.items.values)
    }
    
    func addToCart(item: Product) {
        let cartItem = CartItem(product: item)
        self.items[cartItem.id] = cartItem
    }
    
    func totalSum() -> Float {
        var total: Float = 0.0
        
        for key in Array(self.items.keys) {
            let item = self.items[key]!
            total += item.getTotalPrice()
        }
        
        return total
    }
    
    func isEmpty() -> Bool {
        return self.items.isEmpty
    }
    
    func count() -> Int {
        return self.items.reduce(0, { res, row in
            res + row.value.count
        })
    }
    
    func increment(id: UUID) {
        self.items[id]?.increment()
    }
    
    func decrement(id: UUID) {
        self.items[id]?.decrement()
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
    
    func increment() {
        self.count += 1
    }
    
    func decrement() {
        if self.count > 1 {
            self.count -= 1
        }
        
    }
}
