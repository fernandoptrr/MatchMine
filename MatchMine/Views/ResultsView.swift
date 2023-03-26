//
//  ContentView.swift
//  MatchMine
//
//  Created by Intan Saliya Utomo on 21/03/23.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject private var multiPeer: MultipeerManager
    @State private var showDetails = false
    let viewModel: ResultsViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                MatchingPersentage(value: 75)
                HStack {
                    UserCard(animation: Lotties.beach, username: viewModel.userResults.username)
                    UserCard(animation: Lotties.mountain, username: viewModel.peerResults.username)
                }
                .padding(.horizontal, 12)
                .padding(.top, 16)
                MatchingDetails(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
                    .padding(.top, 24)
                Spacer()
                Button {
                    showDetails.toggle()
                } label: {
                    Text("Show Your Personality Details")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 32)
                .sheet(isPresented: $showDetails) {
                    PersonalDetails(
                        title: viewModel.userResults.getAnimalDetails().label,
                        emojis: viewModel.userResults.getTextEmojis(),
                        interests: viewModel.userResults.interests,
                        desc: viewModel.userResults.getAnimalDetails().description
                    )
                    .padding()
                    .padding(.vertical)
                    .presentationDetents([.medium, .fraction(0.9)])
                    .presentationDragIndicator(.visible)
                }
            }
            .overlay(
                NavigationLink(destination: AppView(), label: {
                    Image(
                        systemName: "house.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.trailing, 16)
                })
                .simultaneousGesture(TapGesture().onEnded{
                    multiPeer.session.disconnect()
                }),
                alignment: .topTrailing
            )
            .padding()
            .background(Color.primaryColor)
            .navigationBarBackButtonHidden()
        }
    }
}

struct MatchingPersentage: View {
    let value: Int
    
    var body: some View {
        VStack {
            Text("You are")
                .foregroundColor(Color(.white))
                .font(Font.custom("Lato", size: 20))
            Text("\(value)%")
                .foregroundColor(Color(.white))
                .font(Font.custom("Lato", size: 64))
            
            Text("Match!")
                .foregroundColor(Color(.white))
                .font(.system(size: 28))
        }
    }
}

struct UserCard: View {
    let animation: String
    let username: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.ultraThinMaterial.opacity(0.3))
                    .shadow(radius: 1)
                LottieView(name: animation, loopMode: .loop)
                    .padding()
            }
            .padding(.horizontal, 8)
            .frame( height: 160)
            Text(username)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}

struct MatchingDetails: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.thinMaterial.opacity(0.3))
                .shadow(radius: 1)
            VStack(alignment: .leading) {
                Text("Matching personalities:")
                    .font(.lato(.regular, size: .body))
                Text(text)
                    .font(.lato(.regular, size: .callout))
                    .padding(.top, 8)
            }
            .foregroundColor(.white)
            .padding(24)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}


struct PersonalDetails: View {
    let title: String
    let emojis: String
    let interests: [Option.Interest]
    let desc: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                Text("Emojis")
                    .font(.lato(.thin, size: .callout))
                    .foregroundColor(.gray)
                    .padding(.bottom, 2)
                Text(emojis)
                    .font(.title)
                Divider()
                    .padding(.top, 4)
                    .padding(.bottom, 16)
                
                Text("Interests")
                    .font(.lato(.thin, size: .callout))
                    .foregroundColor(.gray)
                    .padding(.bottom, 8)
                ChipWrapper(alignment: .center) {
                    ForEach(interests, id: \.self) { interest in
                        Chip(value: interest.rawValue)
                    }
                }
                Divider()
                    .padding(.vertical, 16)
                
                Text("Personality Type")
                    .font(.lato(.thin, size: .callout))
                    .foregroundColor(.gray)
                    .padding(.bottom, 8)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.ultraThinMaterial)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.lato(.regular, size: .body))
                        Text(desc)
                            .font(.lato(.regular, size: .subheadline))
                            .lineSpacing(8)
                            .padding(.top, 4)
                    }
                    .foregroundColor(.black)
                    .padding(24)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewModel: ResultsViewModel(userResults: UserResults(
            username: "John",
            options: [
                Option(
                    animation: Lotties.pepperoniPizza,
                    label: "Pepperoni",
                    disc: .beaver,
                    interest: .yoga,
                    emoji: .haha
                ),
                Option(
                    animation: Lotties.pinapplePizza,
                    label: "Pineapple",
                    disc: .lion,
                    interest: .beach,
                    emoji: .hihi
                    
                ),
                Option(
                    animation: Lotties.mushroomPizza,
                    label: "Mushroom",
                    disc: .goldenRetriever,
                    interest: .love,
                    emoji: .hoho
                )
            ]
        ), peerResults: UserResults(
            username: "Joko",
            options: [
                Option(
                    animation: Lotties.pepperoniPizza,
                    label: "Pepperoni",
                    disc: .beaver,
                    interest: .yoga,
                    emoji: .haha
                ),
                Option(
                    animation: Lotties.pinapplePizza,
                    label: "Pineapple",
                    disc: .lion,
                    interest: .beach,
                    emoji: .hihi
                    
                ),
                Option(
                    animation: Lotties.mushroomPizza,
                    label: "Mushroom",
                    disc: .goldenRetriever,
                    interest: .love,
                    emoji: .hoho
                )
            ]
        )) )
    }
}
