//
//  QuestionsView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    @EnvironmentObject private var multiPeer: MultipeerManager
    
    var body: some View {
        NavigationStack {
            VStack {
                ProgressBar(
                    label: viewModel.getProgressLabel(),
                    value: viewModel.currentQuestionIndex + 1,
                    maximum: viewModel.quiz.count + 1)
                Spacer()
                QuizContent()
                Spacer()
                Footer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden()
        }
        .alert(isPresented: .constant(viewModel.reachedEnd && !multiPeer.didRecieved)) {
            Alert(
                title: Text("Waiting for your peer to finish...")
            )
        }
        .navigationDestination(
            isPresented: .constant(multiPeer.didRecieved && viewModel.reachedEnd)) {
                if multiPeer.receivedResults != nil {
                    ResultsView(viewModel: ResultsViewModel(
                        userResults: UserResults(
                            username: viewModel.username,
                            options: viewModel.userAnswers
                        ),
                        peerResults: multiPeer.receivedResults!))
                    .environmentObject(multiPeer)
                }
            }
    }
}

struct QuizContent: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.quiz[viewModel.currentQuestionIndex].text)
                .font(.lato(.bold, size: .title2))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
                .padding(.bottom, 24)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))]) {
                ForEach(viewModel.quiz[viewModel.currentQuestionIndex].options, id: \.label) { option in
                    QuizOptionCard(option: option)
                        .environmentObject(viewModel)
                        .frame(height: 180)
                        .padding(.all, 8)
                }
            }
        }
        .animation(.interactiveSpring(), value: viewModel.currentQuestionIndex)
        .disabled(viewModel.selectedAnswer != nil)
    }
}

struct Footer: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    @EnvironmentObject private var multiPeer: MultipeerManager
    
    var body: some View {
        HStack {
            Text("\(viewModel.currentQuestionIndex + 1) out of \(viewModel.quiz.count)")
                .font(.lato(.regular, size: .body))
                .foregroundColor(.primaryColor)
            Spacer()
            Button(action: {
                viewModel.submitAnswer()
                if viewModel.reachedEnd {
                    multiPeer.send(result: UserResults(
                        username: viewModel.username,
                        options: viewModel.userAnswers
                    ))
                }
            }, label: {
                Text(
                    (viewModel.currentQuestionIndex != viewModel.quiz.count - 1)
                    ? "Next" : "Finish"
                )
                .padding(.horizontal)
            })
            .buttonStyle(PrimaryButtonStyle())
            .disabled(viewModel.selectedAnswer == nil || viewModel.reachedEnd)
        }
        .padding(.top, 48)
        .padding(.horizontal)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
