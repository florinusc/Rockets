//
//  OnlineRepository.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class OnlineRepository: Repository {
    
    private let sessionManager = SessionManager()
    private let coreDataManager = CoreDataManager()
    
    func getRockets(_ handler: @escaping (Result<[Rocket], Error>) -> Void) {
        do {
            let rockets = try coreDataManager.fetchRockets()
            if rockets.count > 0 {
                handler(Result.success(rockets))
                return
            }
        } catch {}
        sessionManager.request(type: [RocketResource].self, requestType: .rockets) { result in
            switch result {
            case .failure(let error):
                handler(Result.failure(error))
            case .success(let resources):
                let rockets = resources.map { Rocket(resource: $0) }
                do {
                    try self.coreDataManager.save(rockets: rockets)
                } catch {}
                handler(Result.success(rockets))
            }
        }
    }
}
