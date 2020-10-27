//
//  RepositoryDetailsPresenter.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import Domain

protocol RepositoryDetailsPresenter {
    func viewWillAppear()
}

class RepositoryDetailsPresenterImplementation: RepositoryDetailsPresenter {
    
    fileprivate weak var view: RepositoryDetailsView?
    fileprivate var repository: Repository!
    
    init(view: RepositoryDetailsView,
         repository: Repository) {
        self.view = view
        self.repository = repository
    }

}

extension RepositoryDetailsPresenterImplementation {
    
    func viewWillAppear() {
        let repositoryForksNumber = String("\(repository.forks_count)")
        let repositoryStarsNumber = String("\(repository.stargazers_count)")
        let ownerImageUrl = repository.owner.avatar_url ?? ""
        let ownerName = repository.owner.login ?? ""
        let repositoryName = repository.name ?? ""
        
        view?.setOwnerImage(url: ownerImageUrl)
        view?.setOwnerName(name: ownerName)
        view?.setRepositoryName(name: repositoryName)
        view?.setRepositoryForksNumber(count: repositoryForksNumber)
        view?.setRepositoryStarsNumber(count: repositoryStarsNumber)
    }
    
}
