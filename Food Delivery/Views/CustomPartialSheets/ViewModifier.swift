//
//  ViewModifier.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI

extension View {
    /**
     Add a PartialSheet to the current view. You should attach it to your Root View.
     Use the PartialSheetManager as an environment object to present it whenever you want.
     - parameter style: The style configuration for the Partial Sheet.
     */
    public func addPartialSheet() -> some View {
        self.modifier(
            CustomPartialSheet()
        )
    }
}
