//
//  SwiftUIView.swift
//  MatchMine
//
//  Created by Intan Saliya Utomo on 23/03/23.
//

import SwiftUI

struct InterestHStackView: View {
    
    let interests = ["🏀 Sport", "🎮 Video game", "🍴 Food", "✈️ Travel", "🏀 Sport", "🎼 Music"]
    
    var body: some View {
        ChipView(chips: interests)
    }
}

struct InterestHStackView_Previews: PreviewProvider {
    static var previews: some View {
        InterestHStackView()
    }
}


struct ChipView: View {
    
    let chips: [String]
    var groupedChips: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(chips: [String]) {
        self.chips = chips
        self.groupedChips = createGroupedChips(chips)
    }
    
    private func createGroupedChips(_ chips: [String]) -> [[String]] {
        
        var groupedChips: [[String]] = [[String]]()
        var temp: [String] = [String]()
        var width: CGFloat = 0
        
        for content in chips {
            
            let label = UILabel()
            label.text = content
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 32) < screenWidth {
                width += labelWidth
                temp.append(content)
            } else {
                width = labelWidth
                groupedChips.append(temp)
                temp.removeAll()
                temp.append(content)
            }
            
        }
        groupedChips.append(temp)
        return groupedChips
        
    }
    
    var body: some View {
        VStack {
            ForEach(groupedChips, id: \.self) {
                subitems in
                
                HStack {
                    ForEach(subitems, id: \.self) {
                        content in
                        Text(content)
                            .font(Font.custom("Lato", size: 16))
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Capsule().stroke(Color.purple, lineWidth: 1.5))
                    }
                }
            }
        }
    }
}
