//
//  Option.swift
//  MatchMine
//
//  Created by Fernando Putra on 25/03/23.
//

import Foundation

struct Option: Codable {
    let animation: String
    let label: String
    let disc: Animal?
    let interest: Interest?
    let emoji: Emoji?

    
    enum Animal: String, Codable {
        case lion = "Lion"
        case otter = "Otter"
        case beaver = "Beaver"
        case goldenRetriever = "Golden Retriever"
    }
    
    enum Interest: String, Codable{
        case technology = "💻 Technology"
        case money = "💵 Money"
        case love = "❤️ Love"
        case read = "📖 Reading"
        case beach = "🏖️ Beach"
        case mountain = "🏔️ Mountain"
        case forest = "🌲 Forest"
        case city = "🏙️ City"
        case yoga = "🧘 Yoga"
        case hiking = "🥾 Hiking"
        case workout = "💪 Workout"
        case sport = "⚽️ Sport"
    }
    
    enum Emoji: String, Codable {
        case haha = "😎"
        case hehe = "🤪"
        case hihi = "😇"
        case hoho = "🥳"
    }
}
