//
//  QuizViewModel.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var quiz: [Question]
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedAnswer: Option?
    @Published var userAnswers: [Option?] = []
    @Published var reachedEnd: Bool = false

    init() {
        self.quiz = questions
    }

    func submitAnswer() {
        self.userAnswers.append(selectedAnswer)
        if currentQuestionIndex < questions.count - 1 {
            reachedEnd = false
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            reachedEnd = true
        }
    }

    func getProgressLabel() -> String {
        switch currentQuestionIndex {
        case 0...2:
            return "Lets get to know yourself!"
        case 3...5:
            return "You're doing great!"
        case 6...8:
            return "You're almost done!"
        default:
            return ""
        }
    }

}
