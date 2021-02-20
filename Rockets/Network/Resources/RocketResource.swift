//
//  RocketResource.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

struct RocketResource: Decodable {
    
    let name: String
    let imageUrls: [String]
    let successRate: Int
    let active: Bool
    let country: String
    let description: String
    let dateOfFirstFlight: String
    let costPerLaunch: Int
    let wikipediaUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrls = "flickr_images"
        case successRate = "success_rate_pct"
        case active
        case country
        case description
        case dateOfFirstFlight = "first_flight"
        case costPerLaunch = "cost_per_launch"
        case wikipediaUrl = "wikipedia"
    }
    
}
