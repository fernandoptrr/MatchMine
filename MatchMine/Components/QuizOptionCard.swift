//
//  AnswerGrid.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct QuizOptionCard: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @State private var isSelected = false
    var option: Option
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(isSelected ? Color.primaryColor : .white)
                .shadow(radius: isSelected ? 2 : 1)
            VStack {
                LottieView(name: option.animation, loopMode: .loop)
                Text(option.label)
                    .font(.lato(.regular, size: .title3))
                    .foregroundColor(isSelected ? .white : .black)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .scaleEffect(isSelected ? 1.05 : 1)
        .onTapGesture {
            withAnimation(.interactiveSpring()) {
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
                animation: Lotties.ironman,
                label: "Pineapple",
                disc: .lion,
                interest: nil,
                emoji: nil
            )
        )
        .frame(width: 140, height: 180)
        .environmentObject(QuizViewModel())
    }
}
