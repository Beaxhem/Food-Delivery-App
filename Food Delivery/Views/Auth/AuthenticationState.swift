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
                    UserDefaults.standard.setValue(user.email, forKey: "email")
                    
                    
                    self.isNotLoggedIn = false
                }
            } else if let error = error {
                print(error)
                self.error = error as NSError
            }
        }
    }
    
}

extension AuthenticationState {
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
        auth.signIn(withEmail: email, password: password) {[weak self] (res, error) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.handleAuthResultCompletion(auth: res, error: error)
           
            DatabaseManager.shared.getUser(email: email) { res in
                switch res {
                case .success(let user):
                    UserDefaults.standard.setValue(user.name, forKey: "name")
                    self?.userName = user.name
                case .failure(let error):
                    print(error)
                }
                
            }
        }
        UserDefaults.standard.synchronize()
    }
    
    func handleSignInWithApple() {
        
    }
    
    func handleSignInWithGoogle() {
        
    }
}

extension AuthenticationState {
    func register(with option: RegisterOption) {
        switch option {
        case let .emailAndPassword(email, name, password):
            handleSignUpWith(email: email, name: name, password: password)
        default:
            print("Under construction")
        }
    }
    
    func handleSignUpWith(email: String, name: String, password: String) {
        auth.createUser(withEmail: email, password: password) {[weak self] (res, error) in
            guard let strongSelf = self else {
                return
            }
            
            UserDefaults.standard.setValue(name, forKey: "name")
            strongSelf.handleAuthResultCompletion(auth: res, error: error)
            
            let user = Customer(name: name, email: email)
            DatabaseManager.shared.createUser(user: user) { error in
                if let error = error {
                    print(error)
                } else {
                    print("New user")
                }
            }
            
            
            UserDefaults.standard.synchronize()
        }
    }
}
