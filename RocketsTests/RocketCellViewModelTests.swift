//
//  RocketCellViewModelTests.swift
//  RocketsTests
//
//  Created by Florin Uscatu on 21.02.2021.
//

import XCTest
@testable import Rockets

class RocketCellViewModelTests: XCTestCase {

    func test_nameIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.name, "Falcon 1")
    }
    
    func test_dateIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.date, "Mar 24, 2006")
    }
    
    func test_imageUrlIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.imageUrl, "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")
    }
    
    func test_successRateStringIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.successRateString, "20%")
    }
    
    func test_successRateLevelIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.successRateLevel, .low)
    }
    
    private func makeSUT() -> RocketCellViewModel {
        let rocket = MockRepository().rocketFactory()[0]
        return RocketCellViewModel(with: rocket)
    }

}
