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
}

var todayItem: [Today] = [
    Today(appName: "Royal Match", appDescription: "King's Match 3 Puzzle Game", appLogo: "RoyalMatch", bannerTitle: "Go Antiquing in Royal Match", platformTitle: "New Season", artwork: "RoyalMatchArt"),
    Today(appName: "Minion Rush", appDescription: "Endless run with the Minions", appLogo: "MinionRush", bannerTitle: "Game Of The Day", platformTitle: "Apple  Arcade", artwork: "MinionRushArt")
]

