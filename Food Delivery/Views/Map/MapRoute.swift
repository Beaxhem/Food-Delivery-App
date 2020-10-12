//
//  Test.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 09.10.2020.
//

import SwiftUI

struct MapRoute: View {
    @State var companies = [Company]()
    @State var company: Company?
    @State var isActive = false
    @State var isPresented = false
    @EnvironmentObject var settings: SheetManager
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: CompanyDetails(company: company ?? Company()), isActive: self.$isActive) {
                    EmptyView()
                }
                
                MapView(companies: $companies, isActive: $isActive, company: $company)
                    .environmentObject(settings)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
        }.onAppear {
            DatabaseManager.shared.getCompanies { (res) in
                switch res {
                case .success(let companies):
                    self.companies = companies
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}

struct MapRoute_Previews: PreviewProvider {
    static var previews: some View {
        MapRoute()
    }
}
