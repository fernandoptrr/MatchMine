//
//  ProgressBar.swift
//  TriviaGame
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct ProgressBar: View {
    var label: String
    var value: Int
    var maximum: Int
    
    var body: some View {
        VStack {
            Gauge(value: Double(value), in: 0...Double(maximum)) {}
                .gaugeStyle(.accessoryLinearCapacity)
                .scaleEffect(y: 1.5)
            Text(label)
                .font(.lato(.ligth, size: .subheadline))
                .multilineTextAlignment(.center)
                .padding(.top, 4)
        }
        .animation(.spring(), value: value)
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(
            label: "Keep it up! 💪",
            value: 1,
            maximum: 5)
    }
}
