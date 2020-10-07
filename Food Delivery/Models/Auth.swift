//
//  Auth.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 07.10.2020.
//

enum LoginOption {
    case signInWithApple
    case signInWithGoogle
    case emailAndPassword(email: String, password: String)
}

enum RegisterOption {
    case signInWithApple
    case signInWithGoogle
    case emailAndPassword(email: String, name: String, password: String)
}

class Customer: Encodable {
    var name: String
    var email: String
    
    init() {
        self.name = ""
        self.email = ""
    }
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    static func from(dict: [String: String]) -> Customer {
        let user = Customer()
        
        user.name = dict["name"]!
        user.email = dict["email"]!
        
        return user
    }
}
