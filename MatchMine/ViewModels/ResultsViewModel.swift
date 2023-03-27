//
//  ResultsViewModel.swift
//  MatchMine
//
//  Created by Fernando Putra on 26/03/23.
//

import Foundation

struct ResultsViewModel {
    let userResults: UserResults
    let peerResults: UserResults
    
    init(userResults: UserResults, peerResults: UserResults) {
        self.userResults = userResults
        self.peerResults = peerResults
    }
    
    func getMatchingPercentage() -> Int {
        var count: Double = 0.0
        for (index, option) in userResults.options.enumerated() {
            if option.animation == peerResults.options[index].animation {
                count += 1
            }
        }
        return Int((count / 8) * 100)
    }
    
    func getMatchingDetails() -> String {
        var details = """
"""
        for (index, option) in userResults.options.enumerated() {
            if option.animation == peerResults.options[index].animation {
                details += option.explanation
                if (index < userResults.options.count - 1){
                    details += "\n"
                }
            }
        }
        return details
    }
}
