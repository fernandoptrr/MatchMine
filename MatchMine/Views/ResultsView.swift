//
//  ContentView.swift
//  MatchMine
//
//  Created by Intan Saliya Utomo on 21/03/23.
//

import SwiftUI

struct ResultsView: View {
    @State private var inputName: String = ""
    @State private var emojis: String = "🤪 🏀 🌲 🎮"
    @State private var isShowingPersonalSheet = false
    @State var chips: [[ChipData]] = [
        [ChipData(chipContent: "🍴 Food"), ChipData(chipContent: "🎮 Video games"), ChipData(chipContent: "🏀 Sports"), ChipData(chipContent: "🎼 Music"), ChipData(chipContent: "🖥️ Technology"), ChipData(chipContent: "🛍️ Shopping")]
    ]
    var body: some View {
        NavigationStack {
            ZStack() {
                VStack() {
                    Spacer()
                        .frame(height: 40.0)
                    
                    Text("You are")
                        .foregroundColor(Color(.white))
                        .font(Font.custom("Lato", size: 20))
                    
                    Text("75%")
                        .foregroundColor(Color(.white))
                        .font(Font.custom("Lato", size: 78))
                    
                    Text("Match!")
                        .foregroundColor(Color(.white))
                        .font(Font.custom("Lato", size: 28))
                        
                    Spacer()
                        .frame(height: 40.0)
                    
                    HStack() {
                        VStack() {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150.0, height: 180.0)
                                .foregroundColor(Color(.lightGray))
                            Text("John")
                                .bold()
                                .font(Font.custom("Lato", size: 18))
                                .foregroundColor(Color(.white))
                        }
                        
                        VStack() {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150.0, height: 180.0)
                                .foregroundColor(Color(.lightGray))
                            Text("John")
                                .bold()
                                .font(Font.custom("Lato", size: 18))
                                .foregroundColor(Color(.white))
                        }
                    }
                    
                    Spacer()
                        .frame(height: 40.0)
                    
                    ZStack (alignment: .topLeading) {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: .infinity, height: 150.0)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .shadow(radius: 5)
                        
                        VStack(alignment: .leading) {
                            Text("Matching personalities:")
                                .font(Font.custom("Lato", size: 20))
                                .foregroundColor(.white)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                .padding(.vertical, 5)
                                .font(Font.custom("Lato", size: 16))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 30)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        isShowingPersonalSheet.toggle()
                        print("written")
                    } label: {
                        Text("Your personal result!")
                            .frame(width: 350.0, height: 40)
                            .font(Font.custom("Lato", size: 18))
                            .bold()
                            
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 30))
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(Color.white)
                    .foregroundColor(Color(.white))
                    .sheet(isPresented: $isShowingPersonalSheet) {
                        personalBottomSheet
                            .cornerRadius(50)
                            .presentationDetents([.large])
                            .presentationDetents([
                                .fraction(0.70),
                                .fraction(0.80),
                                .fraction(0.90),
                                .fraction(1)])
                            .presentationDragIndicator(.visible)
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.5098039215686274, green: 0.3215686274509804, blue: 0.6588235294117647, opacity: 100.0))
            }
        }
    }
    
    var personalBottomSheet: some View {
        VStack() {
            
            Text("Your Emojis:")
                .frame(alignment: .top)
                .font(Font.custom("Lato", size: 18))
                .fontWeight(Font.Weight.light)
            
            Text("\(emojis)")
                .padding(.top, 5)
                .frame(alignment: .top)
                .font(Font.custom("Lato", size: 20))
                .fontWeight(Font.Weight.light)
            
            Text("Things you can explore:")
                .padding(.top, 20)
                .frame(alignment: .top)
                .font(Font.custom("Lato", size: 18))
                .fontWeight(Font.Weight.light)
                
            InterestHStackView()
            
            ZStack (alignment: .topLeading) {
                
                RoundedRectangle(cornerRadius: 20)
                    .padding(20)
                    .frame(width: .infinity, height: 220.0)
                .foregroundColor(Color(red: 0.5098039215686274, green: 0.3215686274509804, blue: 0.6588235294117647, opacity: 80.0))
                .shadow(radius: 1)
                
                VStack(alignment: .leading) {
                    Text("Your Personality")
                        .padding()
                        .font(Font.custom("Lato", size: 20))
                        .foregroundColor(.white)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding(.horizontal)
                        .font(Font.custom("Lato", size: 16))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
            }
        }
        .padding(.top, 30)
        .frame(alignment: .top)
        .cornerRadius(30)
    }
}

struct ChipData: Identifiable, Hashable {
    var id = UUID().uuidString
    var chipContent: String
    var isExceeded = false
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
