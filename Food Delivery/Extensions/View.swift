//
//  View.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func ifTrue(_ condition:Bool, apply:(AnyView) -> (AnyView)) -> AnyView {
        if condition {
            return apply(AnyView(self))
        }
        else {
            return AnyView(self)
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
