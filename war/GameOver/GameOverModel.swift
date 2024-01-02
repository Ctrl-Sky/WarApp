//
//  GameOverModel.swift
//  war
//
//  Created by Sky Quan on 2023-11-28.
//

import Foundation

struct GameOverPage: Identifiable, Equatable{
    let id = UUID()
    var playerScore: Int
    var cpuScore: Int

    static var samplePage = GameOverPage(playerScore: 25, cpuScore: 1)
}
