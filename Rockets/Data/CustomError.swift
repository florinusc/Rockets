//
//  CustomError.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

enum CustomError: Error {
    
    case general
    case network
    case custom(message: String)
    
}

extension CustomError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .general: return NSLocalizedString("Oops, something went wrong", comment: "General Error")
        case .network: return NSLocalizedString("There's a problem with the network", comment: "Network Error")
        case .custom(let message): return message
        }
    }
    
}
