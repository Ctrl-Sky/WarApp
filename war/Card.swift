//
//  Card.swift
//  war
//
//  Created by Sky Quan on 2023-11-22.
//

import Foundation

class Card{
    var rank: Int
    var suit: Int //Represent suit as int for when calculating score using comparison
    var suitString: String
    var rankString: String
    var cardImage: String
    
    init(rank: Int, suit: Int){
        
        self.rank = rank
        switch rank{
        case 1:
            self.rankString = "ace"
        case 11:
            self.rankString = "jack"
        case 12:
            self.rankString = "queen"
        case 13:
            self.rankString = "king"
        default:
            self.rankString = String(rank)
        }
        
        self.suit = suit
        switch suit{
        case 1:
            self.suitString = "diamonds"
        case 2:
            self.suitString = "clubs"
        case 3:
            self.suitString = "hearts"
        case 4:
            self.suitString = "spades"
        default:
            fatalError("Suit out of bounds")
        }
        
        self.cardImage = self.rankString + "_of_" + self.suitString
        
        if self.rank == 0{
            self.cardImage = "rect"
        }
    }
}
