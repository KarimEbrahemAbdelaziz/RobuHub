//
//  RepositoryDetailsConfigurator.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import Domain
import UIKit

enum RepositoryDetailsConfigurator: ConfiguratorProtocol {
    case repositoryDetailsViewController(repository: Repository)

    var viewController: UIViewController {
        switch self {
        case let .repositoryDetailsViewController(repository):
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let repositoryDetailsViewController = storyboard.instantiateViewController(identifier: "RepositoryDetailsViewController") as! RepositoryDetailsViewController
            let presenter = RepositoryDetailsPresenterImplementation(
                view: repositoryDetailsViewController,
                repository: repository)
            repositoryDetailsViewController.presenter = presenter
            return repositoryDetailsViewController
        }
    }
}
