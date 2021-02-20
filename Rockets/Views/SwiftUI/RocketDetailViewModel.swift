//
//  RocketDetailViewModel.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class RocketDetailViewModel {
    
    private let rocket: Rocket
    
    var name: String { rocket.name }
    var successRate: String { "\(rocket.successRate)%" }
    var successRateLevel: SuccessRateLevel { SuccessRateLevel.level(rate: rocket.successRate) }
    var active: String { rocket.active ? "🚀 Active" : "💤 Inactive" }
    var country: String { "📍 \(rocket.country)" }
    var description: String { rocket.description }
    var dateOfFirstLaunch: String { "📅 \(rocket.dateOfFirstFlight.formattedDate() ?? "")" }
    var costPerLaunch: String { "💰 $\(rocket.costPerLaunch) ~ per launch" }
 
    init(rocket: Rocket) {
        self.rocket = rocket
    }
    
}
