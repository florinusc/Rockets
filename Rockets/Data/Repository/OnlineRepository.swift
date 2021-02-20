//
//  OnlineRepository.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class OnlineRepository: Repository {
    
    private let sessionManager = SessionManager()
    
    func getRockets(_ handler: @escaping (Result<[Rocket], Error>) -> Void) {
        sessionManager.request(type: [RocketResource].self, requestType: .rockets) { result in
            switch result {
            case .failure(let error):
                handler(Result.failure(error))
            case .success(let resources):
                handler(Result.success(resources.map { Rocket(resource: $0) }))
            }
        }
    }
}
