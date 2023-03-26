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
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.pinapplePizza,
                label: "Pineapple",
                disc: .lion,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.mushroomPizza,
                label: "Mushroom",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.cheesePizza,
                label: "Extra Cheese",
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
                animation: Lotties.sherlock,
                label: "Friends",
                disc: .otter,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.dragonFlag,
                label: "Game Of Thrones",
                disc: .lion,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.sherlock,
                label: "Sherlock Holmes",
                disc: .beaver,
                interest: nil,
                emoji: nil
            ),
            Option(
                animation: Lotties.sherlock,
                label: "Stranger Things",
                disc: .goldenRetriever,
                interest: nil,
                emoji: nil
            )
        ]
    ),
//    Question(
//        text: "If you could only eat one food for the rest of your life, what would it be?",
//        options: [
//            Option(
//                animation: Lotties.pizzaBoxOrder,
//                label: "Pizza",
//                disc: .beaver,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.walkingTaco,
//                label: "Tacos",
//                disc: .lion,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.cuteSushi,
//                label: "Sushi",
//                disc: .goldenRetriever,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.burger,
//                label: "Burger",
//                disc: .otter,
//                interest: nil,
//                emoji: nil
//            )
//        ]
//    ),
//    Question(
//        text: "Which of the following activities do you enjoy most on a lazy day?",
//        options: [
//            Option(
//                animation: Lotties.loading,
//                label: "Napping",
//                disc: .goldenRetriever,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.readingBook,
//                label: "Reading a Book",
//                disc: .beaver,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.showTimeIcon,
//                label: "Binge-Watching",
//                disc: .otter,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.brightGameboy,
//                label: "Playing Video Game ",
//                disc: .lion,
//                interest: nil,
//                emoji: nil
//            )
//        ]
//    ),
//    Question(
//        text: "Which of the following physical activities do you prefer?",
//        options: [
//            Option(
//                animation: Lotties.yoga,
//                label: "Yoga",
//                disc: .goldenRetriever,
//                interest: .yoga,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.sherlock,
//                label: "Hiking",
//                disc: .lion,
//                interest: .hiking,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.armsWorkoutGym,
//                label: "Gym",
//                disc: .beaver,
//                interest: .workout,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.sport,
//                label: "Ball Games",
//                disc: .otter,
//                interest: .sport,
//                emoji: nil
//            )
//        ]
//    ),
//    Question(
//        text: "If your boss gave you the opportunity to take an all-expenses-paid trip, where would you jet off to?",
//        options: [
//            Option(
//                animation: Lotties.beach,
//                label: "Beach",
//                disc: .otter,
//                interest: .beach,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.mountain,
//                label: "Mountain",
//                disc: .goldenRetriever,
//                interest: .mountain,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.city,
//                label: "Cityscape",
//                disc: .beaver,
//                interest: nil,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.forest,
//                label: "Forest",
//                disc: .lion,
//                interest: .forest,
//                emoji: nil
//            )
//        ]
//    ),
//    Question(
//        text: "If you could be any fictional character, who would you choose?",
//        options: [
//            Option(
//                animation: Lotties.ironman,
//                label: "Iron Man",
//                disc: nil,
//                interest: .technology,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.faceWithGlasses,
//                label: "Harry Potter",
//                disc: nil,
//                interest: .read,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.crab,
//                label: "Mr.Crab",
//                disc: nil,
//                interest: .money,
//                emoji: nil
//            ),
//            Option(
//                animation: Lotties.sherlock,
//                label: "Jack & Rose",
//                disc: nil,
//                interest: .love,
//                emoji: nil
//            )
//        ]
//    ),
//    Question(
//        text: "If you were in a trip with your friends,what would be your role?",
//        options: [
//            Option(
//                animation: Lotties.sherlock,
//                label: "Guider",
//                disc: nil,
//                interest: .technology,
//                emoji: .haha
//            ),
//            Option(
//                animation: Lotties.sherlock,
//                label: "Trend Setter",
//                disc: nil,
//                interest: nil,
//                emoji: .hehe
//            ),
//            Option(
//                animation: Lotties.sherlock,
//                label: "Ice Breaker",
//                disc: nil,
//                interest: nil,
//                emoji: .hihi
//            ),
//            Option(
//                animation: Lotties.sherlock,
//                label: "Follower",
//                disc: nil,
//                interest: nil,
//                emoji: .hoho
//            )
//        ]
//    ),
]

