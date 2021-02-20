//
//  MockRepository.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

class MockRepository: Repository {
    
    let returnsError: Bool
    
    init(_ returnsError: Bool = false) {
        self.returnsError = returnsError
    }
    
    func getRockets(_ handler: @escaping (Result<[Rocket], Error>) -> Void) {
        if returnsError {
            handler(Result.failure(CustomError.general))
            return
        }
        handler(Result.success([rocketFactory(), rocketFactory(), rocketFactory(), rocketFactory(), rocketFactory()]))
    }
    
    private func rocketFactory() -> Rocket {
        let names = ["Falcon 1",
                     "Falcon 2",
                     "Falcon 3",
                     "Falcon 4"]
        let imageUrls = ["https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",
                         "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg",
                         "https://imgur.com/DaCfMsj.jpg",
                         "https://imgur.com/azYafd8.jpg"]
        let successRates = [20, 40, 90, 61]
        let actives = [false, true]
        let countries = ["USA", "UK", "France", "Germany"]
        let descriptions = ["Fast", "Slow", "Cool", "Red"]
        let datesOfFirstFlight = ["2006-03-24", "2010-12-01", "2009-10-04", "2016-05-14"]
        let costsPerLaunch = [12312, 500000, 900000, 190423]
        let wikipediaUrls = ["https://en.wikipedia.org/wiki/Falcon_1"]
        
        return Rocket(name: names.randomElement() ?? "",
                      imageUrl: imageUrls.randomElement() ?? "",
                      successRate: successRates.randomElement() ?? 0,
                      active: actives.randomElement() ?? false,
                      country: countries.randomElement() ?? "",
                      description: descriptions.randomElement() ?? "",
                      dateOfFirstFlight: datesOfFirstFlight.randomElement() ?? "",
                      costPerLaunch: costsPerLaunch.randomElement() ?? 0,
                      wikipediaUrl: wikipediaUrls.randomElement() ?? "")
    }
}
