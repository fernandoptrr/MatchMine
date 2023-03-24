//
//  AppView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct AppView: View {
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        WelcomeView()
            .environmentObject(viewModel)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(QuizViewModel())
    }
}
