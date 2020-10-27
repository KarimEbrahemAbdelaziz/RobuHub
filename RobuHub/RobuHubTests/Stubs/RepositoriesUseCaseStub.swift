//
//  RepositoriesUseCaseStub.swift
//  RobuHubTests
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import NetworkPlatform
@testable import RobuHub

class RepositoriesUseCaseStub: RepositoriesUseCase {
    func fetchRepositories(_ name: String!, page pageNumber: Int32, countPerPage: Int32, completion: RepositoriesBlock!) {
        completion([])
    }
}
