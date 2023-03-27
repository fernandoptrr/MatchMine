//
//  Results.swift
//  MatchMine
//
//  Created by Fernando Putra on 25/03/23.
//

import Foundation

struct UserResults: Codable {
    let username: String
    let options: [Option]
    
    init(username: String, options: [Option]) {
        self.username = username
        self.options = options
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case options
    }
    
    var animal: Option.Animal {
        var animalCount = [Option.Animal: Int]()
        for option in options {
            if let animal = option.disc {
                animalCount[animal, default: 0] += 1
            }
        }
        guard let mostFrequent = animalCount.max(by: { $0.1 < $1.1 })?.key else {
            return .lion
        }
        return mostFrequent
    }
    
    var interests: [Option.Interest] {
        return options.compactMap { $0.interest }
    }
    
    var emojis: [Option.Emoji] {
        return options.compactMap { $0.emoji }
    }
    
    func getAnimalAnimation() -> String {
        switch animal {
        case .lion:
            return Lotties.lion
        case .otter:
            return Lotties.otter
        case .beaver:
            return Lotties.beaver
        case .goldenRetriever:
            return Lotties.dog
        }
    }
    
    func getTextEmojis() -> String {
        var textEmoji = emojis.map { $0.rawValue }.joined(separator: "")
        switch animal {
        case .lion:
            textEmoji += "🏇🙋"
            break
        case .otter:
            textEmoji += "🗣️🕺"
            break
        case .beaver:
            textEmoji += "💼📆"
            break
        case .goldenRetriever:
            textEmoji += "✌️👨‍👩‍👦"
            break
        }
        return textEmoji
    }
    
    func getAnimalDetails() -> (animation: String, label: String, description: String) {
        switch animal {
        case .lion:
            return (Lotties.lion, "Lion 🦁",
                """
                • You're a natural leader!
                • You have a commanding presence and the courage to stand up for what you believe in.
                • You inspire others with your strength and confidence, and people look to you for guidance and direction.
                """
            )
        case .otter:
            return (Lotties.otter, "Otter 🦦",
                """
                • You're a social butterfly!
                • You bring energy and excitement wherever you go and enjoy making people laugh.
                • You're a natural entertainer, and people are drawn to your playful spirit and sense of humor.
                """
            )
        case .beaver:
            return (Lotties.beaver, "Beaver 🦫",
                """
                • You're a hard worker!
                • You have a strong work ethic and take pride in your ability to get things done.
                • You're persistent and detail-oriented, and you enjoy seeing a project through to completion.
                """
            )
        case .goldenRetriever:
            return (Lotties.dog, "Golden Retriever 🐶",
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
                """
            )
        }
    }
}
