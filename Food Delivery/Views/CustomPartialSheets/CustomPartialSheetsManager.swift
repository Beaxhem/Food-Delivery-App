//
//  CustomPartialSheetsManager.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 29.09.2020.
//

import SwiftUI

public class CustomPartialSheetManager: ObservableObject {

    /// Published var to present or hide the partial sheet
    @Published var isPresented: Bool = false {
        didSet {
            if !isPresented {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
                    self?.content = AnyView(EmptyView())
                    self?.onDismiss = nil
                }
            }
        }
    }
    /// The content of the sheet
    @Published private(set) var content: AnyView
    
    @Published private(set) var style: CustomPartialSheetStyle
    
    /// the onDismiss code runned when the partial sheet is closed
    private(set) var onDismiss: (() -> Void)?

    public init() {
        self.content = AnyView(EmptyView())
        self.style = CustomPartialSheetStyle.defaultStyle()
    }

    /**
      Presents a **Partial Sheet**  with a dynamic height based on his content.
     - parameter content: The content to place inside of the Partial Sheet.
     - parameter onDismiss: This code will be runned when the sheet is dismissed.
     */
    public func showPartialSheet<T>(_ onDismiss: (() -> Void)? = nil, style: CustomPartialSheetStyle, @ViewBuilder content: @escaping () -> T) where T: View {
        self.content = AnyView(content())
        self.onDismiss = onDismiss
        self.style = style
        DispatchQueue.main.async {
            withAnimation {
                self.isPresented = true
            }
        }
    }

    /**
     Updates some properties of the **Partial Sheet**
    - parameter isPresented: If the partial sheet is presented
    - parameter content: The content to place inside of the Partial Sheet.
    - parameter onDismiss: This code will be runned when the sheet is dismissed.
    */
    public func updatePartialSheet<T>(isPresented: Bool? = nil, content: (() -> T)? = nil, onDismiss: (() -> Void)? = nil) where T: View {
        if let content = content {
            self.content = AnyView(content())
        }
        if let onDismiss = onDismiss {
            self.onDismiss = onDismiss
        }
        if let isPresented = isPresented {
            withAnimation {
                self.isPresented = isPresented
            }
        }
    }

    /// Close the Partial Sheet and run the onDismiss function if it has been previously specified
    public func closePartialSheet() {
        self.isPresented = false
        self.onDismiss?()
    }
}
