//
//  QuestionsView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Match Mine")
                        .titleStyle()
                    Spacer()
                    Text("\(viewModel.currentQuestionIndex + 1) out of \(viewModel.quiz.count)")
                        .foregroundColor(.primaryColor)
                        .fontWeight(.heavy)
                }
                .padding(.bottom, 24)
                
                VStack {
                    ProgressBar(value: viewModel.currentQuestionIndex + 1, maximum: viewModel.quiz.count + 1)
                        .environmentObject(viewModel)
                    Text(viewModel.getProgressLabel())
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                }
                .padding(.bottom, 24)
                
                Text(viewModel.quiz[viewModel.currentQuestionIndex].text)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))]) {
                    ForEach(viewModel.quiz[viewModel.currentQuestionIndex].options) { option in
                        QuizOptionCard(option: option)
                            .environmentObject(viewModel)
                            .frame(height: 180)
                            .padding(.all, 8)
                    }
                }
                .disabled(viewModel.selectedAnswer != nil)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.submitAnswer()
                    }, label: {
                        Text("Next")
                            .padding(.horizontal)
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .disabled(viewModel.selectedAnswer == nil)
                }
                .padding(.top, 32)
                .padding(.horizontal)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden()
        }
        .navigationDestination(
            isPresented: .constant(viewModel.reachedEnd)) {
                ResultsView()
            }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
