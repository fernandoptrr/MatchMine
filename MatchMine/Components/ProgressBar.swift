//
//  ProgressBar.swift
//  TriviaGame
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct ProgressBar: View {
    var value: Int
    var maximum: Int

    var body: some View {
        Gauge(value: Double(value), in: 0...Double(maximum)) {}
        .gaugeStyle(.accessoryLinearCapacity)
        .scaleEffect(y: 1.5)
        .animation(.spring(), value: value)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 1, maximum: 5)
    }
}
