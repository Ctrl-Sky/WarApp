//
//  PageModel.swift
//  war
//
//  Created by Sky Quan on 2023-11-23.
//

import Foundation

struct Page: Identifiable, Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: [String]
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for debugging", imageUrl: ["RulesScreen3.1", "RuleScreen3.2"], tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Start the Game!", description: "To start the game, tap on the deal button and two cards will appear. On the left is your card and on the right, the CPU's card. Whoever has the higher card will get earn a point.", imageUrl: ["RulesScreen1"], tag: 0),
        Page(name: "Hierarchy of Rank and Suit!", description: "Points are awarded based on who has the higher rank, with the lowest being 2 and the highest be A. If both of your cards are equal, the suits of your cards will then be compared. Starting from right to left in the picture above, diamonds is the weakest suit and spades is the strongest.",  imageUrl: ["RulesScreen3.1", "RuleScreen3.2"], tag: 1),
        Page(name: "Points!", description: "Whoever has the highest card will then be awarded a point. Each players points can be viewed at the bottom of the game screen. To continue on to the next round, click the deal button again. Remember, there are only 52 cards in a deck, so there will only be 26 rounds. Once all of the rounds are over, the player with the most points will be crowned the winner", imageUrl: ["RulesScreen2"], tag: 2)
    ]
}
