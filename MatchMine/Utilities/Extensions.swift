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
    static let accentColor = Color("AccentColor")
    static let surfaceColor = Color("SurfaceColor")
    
    
}

//extension Font {
//    static let regular
//}
