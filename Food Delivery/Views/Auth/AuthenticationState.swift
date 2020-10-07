//
//  AuthenticationState.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 07.10.2020.
//

import SwiftUI
import Firebase

class AuthenticationState: ObservableObject {
    @Published var isNotLoggedIn = !UserDefaults.standard.bool(forKey: "user_signed_in")
    @Published var userName: String? = UserDefaults.standard.string(forKey: "name")
    @Published var email: String? = UserDefaults.standard.string(forKey: "email")
    @Published var error: NSError?
    
    static let shared = AuthenticationState()
    
    private let auth = Auth.auth()
    
    func login(with loginOption: LoginOption, completion: @escaping () -> Void) {
        switch loginOption {
        case let .emailAndPassword(email, password):
            handleSignInWith(email: email, password: password)
        case .signInWithApple:
            break
        case .signInWithGoogle:
            break
        }
        
        completion()
    }
    
    func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    func handleSignInWithApple() {
        
    }
    
    func handleSignInWithGoogle() {
        
    }
    
    func logOut() {
        self.isNotLoggedIn = true
        self.userName = ""
        self.email = ""
        
        UserDefaults.standard.setValue("", forKey: "name")
        UserDefaults.standard.setValue("", forKey: "email")
        UserDefaults.standard.setValue(false, forKey: "user_signed_in")
    }
    
    private func handleAuthResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            if let user = auth?.user {
                withAnimation {
                    UserDefaults.standard.setValue(true, forKey: "user_signed_in")
                    UserDefaults.standard.setValue("\(String(describing: user.displayName))", forKey: "name")
                    UserDefaults.standard.setValue(user.email, forKey: "email")
                    UserDefaults.standard.synchronize()
                    
                    self.isNotLoggedIn = false
                }
            } else if let error = error {
                self.error = error as NSError
            }
        }
    }
    
}
