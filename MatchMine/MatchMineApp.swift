//
//  MatchMineApp.swift
//  MatchMine
//
//  Created by Fernando Putra on 24/03/23.
//

import SwiftUI

@main
struct MatchMineApp: App {
    @StateObject private var viewModel = QuizViewModel()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(viewModel)
        }
    }
}
