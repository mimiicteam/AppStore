//
//  Today.swift
//  AppStore
//
//  Created by MINH DUC NGUYEN on 03/07/2022.
//

import SwiftUI

//MARK: - Data Model and Sample Data
struct Today: Identifiable {
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artwork: String
    var dummyText: String
}

var todayItem: [Today] = [
    Today(appName: "Royal Match", appDescription: "King's Match 3 Puzzle Game", appLogo: "RoyalMatch", bannerTitle: "Go Antiquing in Royal Match", platformTitle: "New Season", artwork: "RoyalMatchArt", dummyText: "King Robert needs your help to restore Royal Castle’s former glory. Break the obstacles and combine amazing power-ups to beat joyful and challenging levels! Keep unlocking wonderful areas by playing fun match-3 levels! Come along now and join the fun!"),
    Today(appName: "Minion Rush", appDescription: "Endless run with the Minions", appLogo: "MinionRush", bannerTitle: "Game Of The Day", platformTitle: "Apple  Arcade", artwork: "MinionRushArt", dummyText: "Illumination, Universal, and Gameloft bring you Minion Rush, an endless running game that can be enjoyed offline, anytime! Run through lots of cool locations, dodging devious traps, battling vile villains, and collecting loads of bright, beautiful Bananas!")
]

