//
//  CustomBlurEffect.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import Foundation
import SwiftUI

struct CustomBlurEffectView: UIViewRepresentable {

    /// The style of the Blut Effect View
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
