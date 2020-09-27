//
//  Rating.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 27.09.2020.
//

import SwiftUI

struct RatingView: View {
    var rating: Float
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(String(rating))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            Spacer()
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.7)
    }
}
