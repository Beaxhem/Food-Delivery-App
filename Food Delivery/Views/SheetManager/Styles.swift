//
//  Styles.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 30.09.2020.
//
import SwiftUI
import PartialSheet

let cartSheetStyle = PartialSheetStyle(background: .solid(.white),
                                      handlerBarColor: Color(UIColor.systemGray2),
                                      enableCover: true,
                                      coverColor: Color.black.opacity(0.4),
                                      blurEffectStyle: nil,
                                      cornerRadius: 10,
                                      minTopDistance: 300
       )
let addToCartSheetStyle = PartialSheetStyle(background: .blur(.systemMaterialDark),
                                   handlerBarColor: Color(UIColor.systemGray2),
                                   enableCover: true,
                                   coverColor: Color.black.opacity(0.4),
                                   blurEffectStyle: nil,
                                   cornerRadius: 10,
                                   minTopDistance: 300
    )
