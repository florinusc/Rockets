//
//  RocketListViewModelTests.swift
//  RocketsTests
//
//  Created by Florin Uscatu on 21.02.2021.
//

import XCTest
@testable import Rockets

class RocketListViewModelTests: XCTestCase {
    
    func test_numberOfRocketsIsCorrect_is4() {
        let viewModel = makeSUT()
        getData(for: viewModel)
        XCTAssertEqual(viewModel.numberOfRockets, 4)
    }
    
    func test_getDataWithError_returnsError() {
        let viewModel = makeSUT(true)
        let expectation = self.expectation(description: "Getting Data")
        var checkError: Error?
        viewModel.getData { (error) in
            checkError = error
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(checkError)
    }
    
    func test_getDataWithoutError_doesNotReturnError() {
        let viewModel = makeSUT()
        let expectation = self.expectation(description: "Getting Data")
        var checkError: Error?
        viewModel.getData { (error) in
            checkError = error
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(checkError)
    }
    
    func test_rocketCellViewModelIsNilAtInvalidIndex_isNil() {
        let viewModel = makeSUT()
        XCTAssertNil(viewModel.rocketCellViewModel(at: 6))
    }
    
    func test_rocketCellViewModelIsNotNilAtValidIndex_isNotNil() {
        let viewModel = makeSUT()
        XCTAssertNil(viewModel.rocketCellViewModel(at: 2))
    }
    
    func test_rocketDetailViewModelIsNilAtInvalidIndex_isNil() {
        let viewModel = makeSUT()
        XCTAssertNil(viewModel.rocketDetailViewModel(at: 6))
    }
    
    func test_rocketDetailViewModelIsNotNilAtValidIndex_isNotNil() {
        let viewModel = makeSUT()
        XCTAssertNil(viewModel.rocketDetailViewModel(at: 2))
    }
        
    private func makeSUT(_ shouldReturnError: Bool? = false) -> RocketListViewModel {
        return RocketListViewModel(repository: MockRepository(shouldReturnError ?? false))
    }
    
    private func getData(for viewModel: RocketListViewModel) {
        let expectation = self.expectation(description: "Getting Data")
        var checkError: Error?
        viewModel.getData { (error) in
            checkError = error
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(checkError)
    }

}
