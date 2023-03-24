//
//  ContentView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @State private var username: String = ""
    
    var body: some View {
        NavigationStack {
            VStack() {
                WelcomeText()
                CustomTextField(username: $username)
                NavigationLink(
                    destination: QuizView()
                        .environmentObject(viewModel),
                    label: {
                        Text("Host a Room")
                    }
                )
                .buttonStyle(PrimaryButtonStyle(isExpanded: true))
                .padding(.top, 36)
                Button {
                } label: {
                    Text("Join a Room")
                }
                .buttonStyle(PrimaryButtonStyle(type: .outlined, isExpanded: true))
                .padding(.top, 8)
                
                Spacer()
            }
            .padding()
            .ignoresSafeArea(.keyboard)
            .navigationBarBackButtonHidden()
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, -8)
            Text("Match Mine")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 2)
            Text("Get to know your personality type and match with people to create meaningful connections.")
                .font(.callout)
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
        }
    }
}

struct CustomTextField: View {
    @Binding var username: String
    
    var body: some View {
        TextField(
            "What's Your Name?",
            text: $username
        )
        .onSubmit {
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).strokeBorder(Color(UIColor.lightGray), style: StrokeStyle(lineWidth: 1)))
        .textInputAutocapitalization(.words)
        .disableAutocorrection(true)
        .padding(.top, 24)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(QuizViewModel())
    }
}





