//
//  RocketCellViewModel.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class RocketCellViewModel {
    let name: String
    let date: String
    let imageUrl: String
    let successRate: String
    
    init(with rocket: Rocket) {
        name = rocket.name
        date = rocket.dateOfFirstFlight.formattedDate() ?? ""
        imageUrl = rocket.imageUrl
        successRate = "\(rocket.successRate)%"
    }
}
