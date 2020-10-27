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
    var numberOfRepositories: Int { get }
    
    func viewDidLoad()
    func configure(cell: RepositoryCellView, forRow row: Int)
    func didSelect(row: Int)
    func search(for repositoryName: String)
    func loadNextPage()
    func removeSearchItems()
}

class SearchPresenterImplementation: SearchPresenter {
    
    fileprivate weak var view: SearchView?
    fileprivate let searchRepositoriesUseCase: RepositoriesUseCase
    
    // Normally this would be file private as well, we keep it internal so we can inject values for testing purposes
    var repositories = [Repository]() {
        didSet {
            view?.updateRepositoriesList()
            if repositories.isEmpty {
                view?.showEmptyStatus()
            } else {
                view?.hideEmptyStatus()
            }
        }
    }
    private let defaultCountPerPage: Int32 = 10
    private var currentPageNumber = 1
    private var searchQueryName: String = ""
    
    init(view: SearchView,
         searchRepositoriesUseCase: RepositoriesUseCase) {
        self.view = view
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }
    
    // MARK: - Private Functions
    
    private func checkForLastItem(at row: Int) {
        if row == numberOfRepositories - 1 {
            loadNextPage()
        }
    }
    
    var numberOfRepositories: Int {
        return repositories.count
    }

}

extension SearchPresenterImplementation {
    func viewDidLoad() {
        view?.showEmptyStatus()
    }
    
    func configure(cell: RepositoryCellView, forRow row: Int) {
        let repository = repositories[row]
        let createdAt = Date.convertFrom(dateString: repository.created_at) ?? "-"
        cell.display(repoName: repository.name, ownerName: repository.owner.login, ownerImageUrl: repository.owner.avatar_url, creationDate: createdAt)
        checkForLastItem(at: row)
    }
    
    func removeSearchItems() {
        repositories.removeAll()
    }
    
    func search(for repositoryName: String) {
        if repositoryName != searchQueryName {
            currentPageNumber = 1
            self.repositories.removeAll()
        }
        searchQueryName = repositoryName
        view?.hideEmptyStatus()
        view?.showLoadingIndicator()
        searchRepositoriesUseCase.fetchRepositories(repositoryName, page: Int32(currentPageNumber), countPerPage: defaultCountPerPage) { [weak self] repositories in
            self?.view?.hideLoadingIndicator()
            guard let repos = repositories as? [Repository], !repos.isEmpty else {
                return
            }
            
            self?.repositories += repos
        }
    }
    
    func loadNextPage() {
        currentPageNumber += 1
        search(for: searchQueryName)
    }
    
    func didSelect(row: Int) {
        let repoDetailsRoute = SearchRoute.repositoryDetails(repository: repositories[row])
        view?.navigateTo(repoDetailsRoute)
    }
}
