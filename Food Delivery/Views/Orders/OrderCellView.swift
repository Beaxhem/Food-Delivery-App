//
//  OrderCellView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 06.10.2020.
//

import SwiftUI

struct OrderCellView: View {
    var order: Order
    
    @State var company: Company = Company()
    
    let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd/MM/yyyy "
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack {
                    Image(company.logoName)
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            HStack {
                                Text(order.source)
                                    .font(.headline)
                                
                                Text("•")
                                
                                Text(order.status.rawValue.capitalized)
                            }
                            
                            
                            Spacer()
                            
                            Image(systemName: "multiply")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.gray)
                        }
                        Text("\(order.date, formatter: self.dateFormat)")
                            .font(.caption)
                    }
            }
            VStack(spacing: 15) {
                HStack {
                    Text("Destination")
                        .bold()
                    Spacer()
                    Text(order.deliveryDestination)
                }
            
                
                HStack {
                    Text("Payment")
                        .bold()
                    Spacer()
                    Text("Credit card")
                }
                
                HStack {
                    Text("View details")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        
                        .cornerRadius(10)
                    
                    Text(String(format: "%.2f", order.totalPrice) + "$")
                        .font(.title2)
                        .bold()
                }
            }.padding(.top)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        .onAppear(perform: getCompany)
    }
    
    func getCompany() {
        if order.source != "" {
            DatabaseManager.shared.getCompanyByName(order.source) { (res) in
                switch res {
                case .success(let company):
                    self.company = company
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(order: Order())
    }
}
