//
//  RocketCellViewModel.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

final class RocketCellViewModel {
    let name: String
    let date: String
    let imageUrl: String?
    let successRateString: String
    let successRateLevel: SuccessRateLevel
    
    init(with rocket: Rocket) {
        name = rocket.name
        date = rocket.dateOfFirstFlight.formattedDate() ?? ""
        imageUrl = rocket.imageUrl
        successRateString = "\(rocket.successRate)%"
        successRateLevel = SuccessRateLevel.level(rate: rocket.successRate)
    }
}
