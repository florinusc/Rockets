//
//  Rocket.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation
import CoreData

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
    
    init?(object: NSManagedObject) {
        guard let name = object.value(forKey: "name") as? String,
              let imageUrl = object.value(forKey: "imageUrl") as? String,
              let successRate = object.value(forKey: "successRate") as? Int,
              let active = object.value(forKey: "active") as? Bool,
              let country = object.value(forKey: "country") as? String,
              let description = object.value(forKey: "rocketDesc") as? String,
              let dateOfFirstFlight = object.value(forKey: "dateOfFirstFlight") as? String,
              let costPerLaunch = object.value(forKey: "costPerLaunch") as? Int,
              let wikipediaUrl = object.value(forKey: "wikipediaUrl") as? String else { return nil }
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
