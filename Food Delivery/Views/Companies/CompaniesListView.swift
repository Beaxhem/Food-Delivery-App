//
//  CompaniesListView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 25.09.2020.
//

import SwiftUI

struct CompaniesListView: View {
    @State var companies: [Company] = []
    @State var loadingState: LoadingState = .loading
    
    var body: some View {
        LoadingView(state: loadingState) {
            VStack(spacing: 20) {
                ForEach(companies) {company in
                    CompanyView(company: company)
                        
                }
            }
            .padding(.vertical)
        }
        .onAppear(perform: getCompanies)
    }
    
    func getCompanies() {
        sleep(1)
        DatabaseManager.shared.getCompanies { (res) in
            switch res {
            case .success(let result):
                companies = result
                self.loadingState = .done
            case .failure(let error):
                print(error)
                self.loadingState = .cancel
            }
        }
    }
}

struct CompaniesListView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesListView(companies: [Company(name: "Test name", imageName: "mcdonalds")])
    }
}
