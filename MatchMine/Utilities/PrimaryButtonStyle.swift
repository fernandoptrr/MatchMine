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
    var type: ButtonType = .filled
    var isExpanded: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: isExpanded ? .infinity : nil)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .foregroundColor(getColor(for: type).foreground)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(getColor(for: type).background)
                    .overlay(type == .outlined ? RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .stroke(getColor(for: type).foreground) : nil)
            )
    }

    func getColor(for type: ButtonType) -> (background: Color, foreground: Color) {
        switch type {
        case .filled:
            return (.primaryColor, .white)
        case .outlined:
            return (.white, .primaryColor)
        }
    }
}
