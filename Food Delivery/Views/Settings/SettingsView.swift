//
//  SettingsView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 07.10.2020.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var auth: AuthenticationState
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                    
                    if let username = auth.userName {
                        Text(username)
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Button(action: {
                        auth.logOut()
                    }) {
                        Text("Log out")
                    }
                    
                    Text("Hello world")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.white)
                
                .cornerRadius(10)
                .shadow(radius: 3)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
