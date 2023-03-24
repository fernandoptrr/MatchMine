//
//  AnswerGrid.swift
//  TriviaGame
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct QuizOptionCard: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var option: Option
    @State private var isSelected = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(isSelected ? Color.primaryColor : .white)
                .shadow(radius: isSelected ? 2 : 1)
            VStack {
                LottieView(name: option.animation, loopMode: .loop)
                Text(option.label)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .black)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .scaleEffect(isSelected ? 1.05 : 1)
        .onTapGesture {
            withAnimation(.spring(response: 0.25)) {
                if viewModel.selectedAnswer == nil {
                    viewModel.selectedAnswer = option
                    isSelected = true
                }
            }
        }
    }
}

struct AnswerGrid_Previews: PreviewProvider {
    static var previews: some View {
        QuizOptionCard(
            option: Option(
                animation: Lotties.sherlock,
                label: "Pineapple",
                disc: .lion,
                interest: nil
            )
        )
        .frame(width: 140, height: 180)
        .environmentObject(QuizViewModel())
    }
}
