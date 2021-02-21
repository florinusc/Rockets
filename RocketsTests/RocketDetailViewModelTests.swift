//
//  RocketDetailViewModelTests.swift
//  RocketsTests
//
//  Created by Florin Uscatu on 21.02.2021.
//

import XCTest
@testable import Rockets

class RocketDetailViewModelTests: XCTestCase {
    
    func test_nameIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.name, "Falcon 1")
    }
    
    func test_imageUrlIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.imageUrl, "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")
    }
    
    func test_successRateIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.successRate, "20% success rate")
    }
    
    func test_successRateLevelIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.successRateLevel, .low)
    }
    
    func test_activeIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.active, "🚀 Active")
    }
    
    func test_countryIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.country, "📍 USA")
    }
    
    func test_descriptionIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.description, "Fast")
    }
    
    func test_dateOfFirstLaunchIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.dateOfFirstLaunch, "📅 Mar 24, 2006")
    }
    
    func test_costPerLaunchIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.costPerLaunch, "💰 $12312 ~ per launch")
    }
    
    func test_wikipediaUrlIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.wikipediaURL, URL(string:"https://en.wikipedia.org/wiki/Falcon_1"))
    }

    private func makeSUT() -> RocketDetailViewModel {
        let rocket = MockRepository().rocketFactory()[0]
        return RocketDetailViewModel(rocket: rocket)
    }

}
