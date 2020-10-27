//
//  SearchConfigurator.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import NetworkPlatform
import UIKit

enum SearchConfigurator: ConfiguratorProtocol {
    case searchViewController

    var viewController: UIViewController {
        switch self {
        case .searchViewController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let searchViewController = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
            let searchRepositoriesUseCase = UseCaseProvider().makeRepositoriesUseCase()
            let presenter = SearchPresenterImplementation(
                view: searchViewController,
                searchRepositoriesUseCase: searchRepositoriesUseCase!)
            searchViewController.presenter = presenter
            return searchViewController
        }
    }
}
