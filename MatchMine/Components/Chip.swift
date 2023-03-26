//
//  Chip2.swift
//  MatchMine
//
//  Created by Fernando Putra on 25/03/23.
//

import SwiftUI

struct Chip: View {
    let value: String
    
    var body: some View {
        Text(value)
            .font(.lato(.regular, size: .caption))
            .foregroundColor(.primaryColor)
            .background(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Color.primaryColor, lineWidth: 1)
            )
    }
}

struct Chip2_Previews: PreviewProvider {
    static var previews: some View {
        Chip(value: "😁 Humble")
    }
}
