//
//  Rocket.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class Rocket {
    let name: String
    let imageUrl: String?
    let successRate: Int
    let active: Bool
    let country: String
    let description: String
    let dateOfFirstFlight: String
    let costPerLaunch: Int
    let wikipediaUrl: String
    
    init(resource: RocketResource) {
        self.name = resource.name
        self.imageUrl = resource.imageUrls.first
        self.successRate = resource.successRate
        self.active = resource.active
        self.country = resource.country
        self.description = resource.description
        self.dateOfFirstFlight = resource.dateOfFirstFlight
        self.costPerLaunch = resource.costPerLaunch
        self.wikipediaUrl = resource.wikipediaUrl
    }
    
    init(name: String, imageUrl: String, successRate: Int, active: Bool, country: String, description: String, dateOfFirstFlight: String, costPerLaunch: Int, wikipediaUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.successRate = successRate
        self.active = active
        self.country = country
        self.description = description
        self.dateOfFirstFlight = dateOfFirstFlight
        self.costPerLaunch = costPerLaunch
        self.wikipediaUrl = wikipediaUrl
    }
}
