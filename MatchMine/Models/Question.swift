//
//  Question.swift
//  MatchMine
//
//  Created by Fernando Putra on 25/03/23.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [Option]
}

let questions = [
    Question(
        text: "If you were a pizza topping, which one would you be?",
        options: [
            Option(
                animation: Lotties.pepperoniPizza,
                label: "Pepperoni",
                explanation: "• You both are classic and traditional people.",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.pinapplePizza,
                label: "Pineapple",
                explanation: "• You both are adventures and unique people.",
                disc: .lion,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.mushroomPizza,
                label: "Mushroom",
                explanation: "• You both are versatile and adaptable people.",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.cheesePizza,
                label: "Extra Cheese",
                explanation: "• You both are indulgent and cheesy people.",
                disc: .otter,
                interest: nil,
                emoji: nil
            ),
        ]
    ),
    Question(
        text: "Which of the following TV shows would you prefer to binge-watch?",
        options: [
            Option(
                animation: Lotties.friends,
                label: "Friends",
                explanation: "• You both are social and loyal individuals.",
                disc: .otter,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.dragonFlag,
                label: "Game Of Thrones",
                explanation: "• You both are complex and strategic enthusiasts.",
                disc: .lion,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.sherlock,
                label: "Sherlock Holmes",
                explanation: "• You both are analytical and intellectual minds.",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.strangerThings,
                label: "Stranger Things",
                explanation: "• You both are nostalgic and curious fans.",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "If you could only eat one food for the rest of your life, what would it be?",
        options: [
            Option(
                animation: Lotties.pizza,
                label: "Pizza",
                explanation: "• You both are comfort-loving and easy-going foodies.",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.taco,
                label: "Tacos",
                explanation: "• You both are laid-back and spicy eaters.",
                disc: .lion,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.sushi,
                label: "Sushi",
                explanation: "• You both are adventurous sophisticated diners.",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.burger,
                label: "Burger",
                explanation: "• You both are classic and all-American food enthusiasts.",
                disc: .otter,
                interest: nil,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "Which of the following activities do you enjoy most on a lazy day?",
        options: [
            Option(
                animation: Lotties.napping,
                label: "Napping",
                explanation: "• You both are relaxed and low-key individuals.",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.reading,
                label: "Reading a Book",
                explanation: "• You both are intellectual and curious readers.",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.watching,
                label: "Binge-Watching",
                explanation: "• You both are chill and entertainment-loving viewers.",
                disc: .otter,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.game,
                label: "Playing Video Game",
                explanation: "• You both are competitive and immersive gamers.",
                disc: .lion,
                interest: nil,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "If you were given a vacation for a couple days, what place would you choose?",
        options: [
            Option(
                animation: Lotties.beach,
                label: "Beach",
                explanation: "• You both are free-spirited and relaxed sun-seekers.",
                disc: .otter,
                interest: .beach,
                emoji: nil
            ),
            Option(
                animation: Lotties.mountain,
                label: "Mountain",
                explanation: "• You both are adventurous and nature-loving hikers.",
                disc: .goldenRetriever,
                interest: .mountain,
                emoji: nil
            ),
            Option(
                animation: Lotties.city,
                label: "Cityscape",
                explanation: "• You both are cosmopolitan and city-loving urbanites.",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.forest,
                label: "Forest",
                explanation: "• You both are outdoorsy and peaceful nature enthusiasts.",
                disc: .lion,
                interest: .forest,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "Which of the following physical activities do you prefer?",
        options: [
            Option(
                animation: Lotties.yoga,
                label: "Yoga",
                explanation: "• You both are mindful and health-conscious people.",
                disc: .goldenRetriever,
                interest: .yoga,
                emoji: nil
            ),
            Option(
                animation: Lotties.hiking,
                label: "Hiking",
                explanation: "• You both are active nature-loving people.",
                disc: .lion,
                interest: .hiking,
                emoji: nil
            ),
            Option(
                animation: Lotties.gym,
                label: "Gym",
                explanation: "• You both are fitness-focused and determined people.",
                disc: .beaver,
                interest: .workout,
                emoji: nil
            ),
            Option(
                animation: Lotties.sport,
                label: "Ball Games",
                explanation: "• You both are competitive and sport-loving people.",
                disc: .otter,
                interest: .sport,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "If you could be any fictional character, who would you choose?",
        options: [
            Option(
                animation: Lotties.ironman,
                label: "Iron Man",
                explanation: "• You both are tech-savvy and heroic people.",
                disc: nil,
                interest: .technology,
                emoji: nil
            ),
            Option(
                animation: Lotties.harryPotter,
                label: "Harry Potter",
                explanation: "• You both are imaginative and fantasy-loving people.",
                disc: nil,
                interest: .read,
                emoji: nil
            ),
            Option(
                animation: Lotties.crab,
                label: "Mr.Krabs",
                explanation: "• You both are money-conscious and hardworking people.",
                disc: nil,
                interest: .money,
                emoji: nil
            ),
            Option(
                animation: Lotties.titanic,
                label: "Jack & Rose",
                explanation: "• You both are romantic and dramatic people.",
                disc: nil,
                interest: .love,
                emoji: nil
            )
        ]
    ),
    Question(
        text: "What role would you describe yourself if you were on vacation with your friends?",
        options: [
            Option(
                animation: Lotties.guider,
                label: "Guider",
                explanation: "• You both are helpful and compassionate people.",
                disc: .lion,
                interest: .technology,
                emoji: .guider
            ),
            Option(
                animation: Lotties.trendSetter,
                label: "Trend Setter",
                explanation: "• You both are fashion-forward and individualistic people.",
                disc: .goldenRetriever,
                interest: nil,
                emoji: .trendSetter
            ),
            Option(
                animation: Lotties.iceBreaker,
                label: "Ice Breaker",
                explanation: "• You both are social and confident people.",
                disc: .otter,
                interest: nil,
                emoji: .iceBreaker
            ),
            Option(
                animation: Lotties.follower,
                label: "Follower",
                explanation: "• You both are team player and adaptive people.",
                disc: .beaver,
                interest: nil,
                emoji: .follower
            )
        ]
    ),
]

