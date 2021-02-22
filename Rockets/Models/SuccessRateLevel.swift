//
//  SuccessRateLevel.swift
//  Rockets
//
//  Created by Florin Uscatu on 22.02.2021.
//

import Foundation

enum SuccessRateLevel {
    case low
    case mid
    case high
    
    static func level(rate: Int) -> SuccessRateLevel {
        if rate >= 60 {
            return .high
        } else if rate >= 30 {
            return .mid
        } else {
            return .low
        }
    }
}
