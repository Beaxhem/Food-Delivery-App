//
//  SearchFieldView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 26.09.2020.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var text: String
    @Binding var typing: Bool
    
    var placeholderText = "Search ..."
    
    var body: some View {
        TextField(placeholderText, text: $text, onEditingChanged: {
            typing = $0
        })
            .padding(10)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldView(text: .constant(""), typing: .constant(false))
    }
}
