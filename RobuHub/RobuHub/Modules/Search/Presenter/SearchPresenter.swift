//
//  SearchPresenter.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import Domain
import NetworkPlatform

protocol SearchPresenter {
    func search(for repository: String, at pageNumber: Int, countPerPage: Int)
}

class SearchPresenterImplementation: SearchPresenter {
    
    fileprivate weak var view: SearchView?
    fileprivate let searchRepositoriesUseCase: RepositoriesUseCase
    
    // Normally this would be file private as well, we keep it internal so we can inject values for testing purposes
    var repositories = [Repository]()
    
    init(view: SearchView,
         searchRepositoriesUseCase: RepositoriesUseCase) {
        self.view = view
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }

}

extension SearchPresenterImplementation {
    func search(for repository: String, at pageNumber: Int, countPerPage: Int) {
        searchRepositoriesUseCase.fetchRepositories(repository, page: 1, countPerPage: Int32(countPerPage)) { repositories in
            guard let repos = repositories as? [Repository] else {
                print("Can't parse.")
                return
            }
        }
    }
}
