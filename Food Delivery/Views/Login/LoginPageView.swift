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
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                    Text("Welcome to the Deliverme.")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        
                    
                    Text("Sign up")
                        .padding()
                        
                    VStack {
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
                    
                    NavigationLink(destination: CompaniesView(), label: {
                        Text("Already signed up?")
                            .font(.callout)
                    })
                }
                .padding()
            }
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView(login: "", password: "")
    }
}
