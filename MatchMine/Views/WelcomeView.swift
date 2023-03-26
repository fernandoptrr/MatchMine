//
//  ContentView.swift
//  MatchMine
//
//  Created by Fernando Putra on 23/03/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    @State private var multiPeer: MultipeerManager?
    @State private var username: String = ""
    @State private var showSheet = false
    @State private var paired = false
    
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination:
                            (multiPeer != nil) ? QuizView().environmentObject(multiPeer!) : nil,
                           isActive: $paired){}
            VStack {
                WelcomeText()
                CustomTextField(text: $username)
                Button {
                    viewModel.username = username
                    multiPeer = MultipeerManager(username: username)
                    showSheet.toggle()
                } label: {
                    Text("Start")
                }
                .buttonStyle(PrimaryButtonStyle(
                    isExpanded: true)
                )
                .disabled(username.isEmpty)
                .buttonStyle(PrimaryButtonStyle(isExpanded: true))
                .padding(.top, 32)
                Spacer()
            }
            .padding()
            .ignoresSafeArea(.keyboard)
            .navigationBarBackButtonHidden()
            .sheet(isPresented: $showSheet) {
                if multiPeer != nil {
                    PairView(showSheet: $showSheet, paired: $paired)
                        .environmentObject(multiPeer!)
                        .padding(.vertical)
                        .presentationDetents([.fraction(0.2), .medium])
                }
            }
        }
        .onAppear{
            viewModel.resetQuiz()
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .font(.lato(.bold, size: .title2))
                .padding(.bottom, -8)
            Text("MatchMine")
                .font(.lato(.black, size: .largeTitle))
                .foregroundColor(.primaryColor)
                .tracking(1)
                .padding(.bottom, 8)
            Text("Get to know your personality type and match with people to create meaningful connections.")
                .font(.lato(.regular, size: .callout))
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
        }
    }
}

struct CustomTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField(
            "What's Your Name?",
            text: $text
        )
        .font(.lato(.regular, size: .body))
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).strokeBorder(Color(UIColor.lightGray), style: StrokeStyle(lineWidth: 1)))
        .textInputAutocapitalization(.words)
        .disableAutocorrection(true)
        .padding(.top, 16)
    }
}

struct PairView: View {
    @EnvironmentObject private var multiPeer: MultipeerManager
    @Binding var showSheet: Bool
    @Binding var paired: Bool
    
    
    var body: some View {
        if !multiPeer.paired {
            VStack(alignment: .leading){
                Text("Searching for nearby peers...")
                    .font(.lato(.regular, size: .subheadline))
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                List(multiPeer.availablePeers, id: \.self) { peer in
                    Button(peer.displayName) {
                        multiPeer.serviceBrowser.invitePeer(peer, to: multiPeer.session, withContext: nil, timeout: 30)
                    }
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .listStyle(.inset)
                .alert("Received an invite from \(multiPeer.recievedInviteFrom?.displayName ?? "ERR")!", isPresented: $multiPeer.recievedInvite) {
                    Button("Accept invite") {
                        if (multiPeer.invitationHandler != nil) {
                            multiPeer.invitationHandler!(true, multiPeer.session)
                        }
                    }
                    Button("Reject invite") {
                        if (multiPeer.invitationHandler != nil) {
                            multiPeer.invitationHandler!(false, nil)
                        }
                    }
                }
                
            }
            .onDisappear{
                if multiPeer.paired {
                    showSheet.toggle()
                    paired = true
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(QuizViewModel())
    }
}
