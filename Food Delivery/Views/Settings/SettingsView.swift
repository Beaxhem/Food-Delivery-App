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
        VStack {
            HStack {
                Image(systemName: "person.fill")
                
                Text(auth.userName!)
                    .font(.title)
                    .bold()
            }
            Spacer()
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
