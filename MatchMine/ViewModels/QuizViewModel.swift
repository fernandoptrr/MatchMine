//
//  QuizViewModel.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var quiz: [Question]
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedAnswer: Option?
    @Published var userAnswers: [Option] = []
    @Published var reachedEnd: Bool = false
    
    init() {
        self.quiz = questions
    }
    
    func submitAnswer() {
        if reachedEnd { return }
        if let answer = selectedAnswer {
            self.userAnswers.append(answer)
            if currentQuestionIndex < questions.count - 1 {
                reachedEnd = false
                currentQuestionIndex += 1
                selectedAnswer = nil
            } else {
                reachedEnd = true
            }
        }
    }
    
    
    func resetQuiz(){
        username = ""
        currentQuestionIndex = 0
        selectedAnswer = nil
        userAnswers.removeAll()
        reachedEnd = false
    }
    
    func getProgressLabel() -> String {
        switch currentQuestionIndex {
        case 0...2:
            return "Unwrap your personality with fun test!"
        case 3...4:
            return "You're doing great!"
        case 5...6:
            return "You're almost done!"
        case 7:
            return "Just one more question!"
        default:
            return ""
        }
    }
    
}
