//
//  RegisterPageView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 07.10.2020.
//

import SwiftUI

struct RegisterPageView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var auth: AuthenticationState
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                ScrollView {
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
                            if let error = auth.error {
                                Text("\(error.localizedDescription)")
                                    .foregroundColor(.red)
                            }
                            TextField("Your name", text: $name)
                                .modifier(TextFieldStyle())
                                
                            TextField("Email address", text: $email)
                                .modifier(TextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .keyboardType(.emailAddress)
                                
                            SecureField("Password", text: $password)
                                .modifier(TextFieldStyle())
                            
                            
                        }
                        .padding(.vertical)
                        
                        Button(action: {
                            auth.register(with: .emailAndPassword(email: email, name: name, password: password))
                        }) {
                            Text("Register")
                                .modifier(BigButtonStyle())
                        }
                        NavigationLink(destination: LoginPageView(), label: {
                            Text("Already signed up?")
                                .font(.callout)
                        })
                    }.padding()
                }
            }
            
        }
    }
}

struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
