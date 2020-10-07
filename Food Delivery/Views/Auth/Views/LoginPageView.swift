//
//  LoginPageView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 03.10.2020.
//

import SwiftUI

struct LoginPageView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var isOpened = false
    
    @EnvironmentObject var auth: AuthenticationState
    
    var body: some View {
        ProgressHUDView(isShowing: $isOpened, text: "Loading") {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Image("logo")
                            .resizable()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                        Text("Welcome back!")
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                            
                        
                        Text("Sign in")
                            .padding()
                            
                        VStack {
                            if let error = auth.error {
                                Text("\(error.localizedDescription)")
                                    .foregroundColor(.red)
                            }
                            
                            TextField("Email address/Login", text: $login)
                                .modifier(TextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .keyboardType(.emailAddress)
                                
                            SecureField("Password", text: $password)
                                .modifier(TextFieldStyle())
                        }
                        .padding(.vertical)
                        
                        Button(action: {
                            self.isOpened = true
                            
                            auth.login(with: .emailAndPassword(email: login, password: password)) {
                                self.isOpened = false
                            }
                        }) {
                            Text("Log in")
                                .modifier(BigButtonStyle())
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView(login: "", password: "")
    }
}
