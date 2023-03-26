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
}
