//
//  Cart.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI

class Cart: ObservableObject {
    @Published var source: String
    @Published var items: [UUID: CartItem]
    
    init() {
        self.items = [:]
        self.source = ""
    }
    
    init(items: [UUID: CartItem], source: String) {
        self.items = items
        self.source = ""
    }
    
    func getItems() -> [CartItem] {
        return Array(self.items.values)
    }
    
    func addToCart(item: Product) {
        let cartItem = CartItem(product: item)
        self.items[cartItem.id] = cartItem
    }
    
    func deleteFromCart(id: UUID) {
        items.remove(at: items.index(forKey: id)!)
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

class CartItem: Identifiable, Encodable {
    var id: UUID
    var product: Product
    var count: Int
    
    init() {
        self.id = UUID()
        self.product = Product()
        self.count = 1
    }
    init(product: Product, count: Int = 1) {
        self.id = UUID()
        self.product = product
        self.count = count
    }
    
    static func from(dict: [String: Any]) -> CartItem {
        let item = CartItem()
        
        item.count = dict["count"] as! Int
        item.product = Product.from(dict: dict["product"] as! [String: Any])
        
        return item
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
