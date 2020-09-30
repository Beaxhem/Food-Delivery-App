//
//  SheetManager.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 30.09.2020.
//
import SwiftUI
import PartialSheet

class SheetManager: ObservableObject {
    @Published var style: PartialSheetStyle
    
    private var sheetManager: PartialSheetManager? = nil
    
    init(style: PartialSheetStyle = PartialSheetStyle.defaultStyle()) {
        self.style = style
    }
    
    func showPartialSheet<Content: View>(style: PartialSheetStyle? = nil, _ onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) {
        var doOnDismiss = onDismiss
        if style != nil {
            let prevStyle = self.style
            doOnDismiss = {
                onDismiss?()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35, execute: {
                    self.style = prevStyle
                })
                
            }
            
            self.style = style!
        }
        
        sheetManager!.showPartialSheet(doOnDismiss, content: {
            AnyView(content())
        })
    }
    
    func setManager(manager: PartialSheetManager) -> SheetManager {
        self.sheetManager = manager
        
        return self
    }
}
