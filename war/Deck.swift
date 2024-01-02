//
//  Deck.swift
//  war
//
//  Created by Sky Quan on 2023-11-22.
//

import Foundation

class Deck {
    var cards: [Card]
    
    init(){
        cards = [Card]()
        for i in 1...13{
            for j in 1...4{
                let card = Card(rank: i, suit: j)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func refill(){
        cards = [Card]()
        for i in 1...13{
            for j in 1...4{
                let card = Card(rank: i, suit: j)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func draw() -> Card? {
        if cards.isEmpty{
            return nil
        }
        else{
            return cards.remove(at: 0)
        }
    }
}
