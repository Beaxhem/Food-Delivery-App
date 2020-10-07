//
//  Order.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 05.10.2020.
//
import SwiftUI

class Order: Encodable, Identifiable {
    var id: UUID
    var customerName: String
    var customerEmail: String
    var items: [CartItem]
    var totalPrice: Float
    var deliveryDestination: String
    var status: Status = .waiting
    var source: String
    var date: Date
    
    init() {
        self.id = UUID()
        self.customerEmail = ""
        self.customerName = ""
        self.items = []
        self.totalPrice = 0
        self.deliveryDestination = ""
        self.source = ""
        self.date = Date()
    }
    
    init(items: [CartItem], totalPrice: Float, deliveryDestination: String, source: String) {
        self.id = UUID()
        self.customerEmail = UserDefaults.standard.string(forKey: "email")!
        self.customerName = UserDefaults.standard.string(forKey: "name")!
        self.items = items
        self.totalPrice = totalPrice
        self.deliveryDestination = deliveryDestination
        self.source = source
        self.date = Date()
    }
    
    static func from(dict: [String: Any]) -> Order {
        let order = Order()
        
        order.deliveryDestination = dict["deliveryDestination"] as! String
        order.source = dict["source"] as! String
        order.status = Status(rawValue: dict["status"] as! String)!
        order.totalPrice = dict["totalPrice"] as! Float
        
        var items = [CartItem]()
        for order_dict in dict["items"] as! [[String: Any]] {
            let item = CartItem.from(dict: order_dict)
            
            items.append(item)
        }
        order.items = items
        
        return order
    }
    
    enum Status: String, Encodable {
        case waiting = "waiting"
        case inProcess = "isProcess"
        case done = "done"
    }
    
}

extension Encodable {
    func getDict() -> [String: Any]? {
        do {
            let jsonData = try self.jsonData()
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return json as? [String: Any]
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    /// Encode into JSON and return `Data`
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
