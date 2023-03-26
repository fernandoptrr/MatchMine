//
//  PrimaryButtonStyle.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    enum ButtonType {
        case filled, outlined
    }
    @Environment(\.isEnabled) var isEnabled
    var type: ButtonType = .filled
    var isExpanded: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: isExpanded ? .infinity : nil)
            .font(.lato(.regular, size: .body))
            .foregroundColor(getColor(for: type).foreground)
            .background(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(getColor(for: type).background)
                    .overlay(type == .outlined ? RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .stroke(getColor(for: type).foreground) : nil)
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
    
    func getColor(for type: ButtonType) -> (background: Color, foreground: Color) {
        switch type {
        case .filled:
            return isEnabled ? (.primaryColor, .white) : (Color(UIColor.systemGray4), .gray)
        case .outlined:
            return isEnabled ? (.white, .primaryColor) : (.white, Color(UIColor.systemGray3))
        }
    }
}
