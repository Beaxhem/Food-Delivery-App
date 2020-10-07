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
