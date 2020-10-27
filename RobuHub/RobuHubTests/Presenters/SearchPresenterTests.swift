//
//  SearchPresenterTests.swift
//  RobuHubTests
//
//  Created by KarimEbrahem on 10/27/20.
//

import XCTest
@testable import RobuHub

class SearchPresenterTests: XCTestCase {
    
    let searchViewSpy = SearchViewSpy()
    let repositoriesUseCaseStub = RepositoriesUseCaseStub()
    var searchPresenter: SearchPresenterImplementation!

    override func setUp() {
        super.setUp()
        
        searchPresenter = SearchPresenterImplementation(view: searchViewSpy, searchRepositoriesUseCase: repositoriesUseCaseStub)
    }
    
    override func tearDown() {
        super.tearDown()
        
        searchPresenter = nil
    }

    // MARK: - Tests
    
    func test_viewDidLoad_success_showEmptyStatusView_called() {
        // Given
        let searchQuery = "Swift"
        
        // When
        searchPresenter.search(for: searchQuery)
        
        // Then
        XCTAssertTrue(searchViewSpy.isShowEmptyStatusCalled, "ShowEmptyStatus was not called")
    }
    
    func test_viewDidLoad_success_showLoadingIndicatorView_called() {
        // Given
        let searchQuery = "Swift"
        
        // When
        searchPresenter.search(for: searchQuery)
        
        // Then
        XCTAssertTrue(searchViewSpy.isShowLoadingIndicatorCalled, "ShowLoadingIndicator was not called")
    }
    
    func test_viewDidLoad_success_updateRepositoriesListView_called() {
        // Given
        let searchQuery = "Swift"
        
        // When
        searchPresenter.search(for: searchQuery)
        
        // Then
        XCTAssertTrue(searchViewSpy.isUpdateRepositoriesListCalled, "UpdateRepositoriesList was not called")
    }

}
