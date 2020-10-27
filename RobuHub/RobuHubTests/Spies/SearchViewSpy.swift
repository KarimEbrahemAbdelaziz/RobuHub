//
//  SearchViewSpy.swift
//  RobuHubTests
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
@testable import RobuHub

class SearchViewSpy: SearchView {
    var isShowLoadingIndicatorCalled = false
    var isHideLoadingIndicatorCalled = false
    var isShowEmptyStatusCalled = false
    var isHideEmptyStatusCalled = false
    var isUpdateRepositoriesListCalled = false
    
    func showLoadingIndicator() {
        isShowLoadingIndicatorCalled.toggle()
    }
    
    func hideLoadingIndicator() {
        isHideLoadingIndicatorCalled.toggle()
    }
    
    func showEmptyStatus() {
        isShowEmptyStatusCalled.toggle()
    }
    
    func hideEmptyStatus() {
        isHideEmptyStatusCalled.toggle()
    }
    
    func updateRepositoriesList() {
        isUpdateRepositoriesListCalled.toggle()
    }
    
    func navigateTo(_ route: Route) { }
    
    func updateViewTheme() { }
}
