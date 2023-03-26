//
//  AppView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        WelcomeView()
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(QuizViewModel())
    }
}
