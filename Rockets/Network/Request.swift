//
//  Request.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

enum Request {
    case rockets
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        
        switch self {
        case .rockets: components.path = "/v4/rockets"
        }
        
        return components.url
    }

}
