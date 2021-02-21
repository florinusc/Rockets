//
//  RocketListViewModel.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

final class RocketListViewModel {
    
    let repository: Repository
    
    private var rockets = [Rocket]()
    
    var numberOfRockets: Int { rockets.count }
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getData(_ handler: @escaping (Error?) -> Void) {
        repository.getRockets { result in
            switch result {
            case .failure(let error):
                handler(error)
            case .success(let rockets):
                self.rockets = rockets
                handler(nil)
            }
        }
    }
    
    func rocketCellViewModel(at index: Int) -> RocketCellViewModel? {
        guard index >= 0, index < numberOfRockets else { return nil }
        return RocketCellViewModel(with: rockets[index])
    }
    
    func rocketDetailViewModel(at index: Int) -> RocketDetailViewModel? {
        guard index >= 0, index < numberOfRockets else { return nil }
        return RocketDetailViewModel(rocket: rockets[index])
    }
    
}
