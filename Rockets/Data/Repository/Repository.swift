//
//  Repository.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

protocol Repository {
    func getRockets(_ handler: @escaping (Result<[Rocket], Error>) -> Void)
}
