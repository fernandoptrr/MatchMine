//
//  Extensions.swift
//  MatchMine
//
//  Created by Fernando Putra on 24/03/23.
//

import SwiftUI

extension Text {
    func titleStyle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.primaryColor)
    }
}

extension Color {
    static let primaryColor = Color("PrimaryColor")
    static let onPrimaryColor = Color("OnPrimaryColor")
    static let surfaceColor = Color("SurfaceColor")
}

extension Font {
    enum FontType: String {
        case thin = "Lato-Thin"
        case ligth = "Lato-Light"
        case regular = "Lato-Regular"
        case bold = "Lato-Bold"
        case black = "Lato-Black"
    }
    
    enum FontSize: CGFloat {
        case largeTitle = 34.0
        case title = 28.0
        case title2 = 22.0
        case title3 = 20.0
        case body = 17.0
        case callout = 16.0
        case subheadline = 15.0
        case footnote = 13.0
        case caption = 12.0
        case caption2 = 11.0
    }
    
    static func lato(_ font: FontType, size: FontSize) -> SwiftUI.Font{
        SwiftUI.Font.custom(font.rawValue, size: size.rawValue)
    }
}
