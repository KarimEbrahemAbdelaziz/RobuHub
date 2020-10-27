//
//  SearchRoute.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import UIKit
import Domain

enum SearchRoute: Route {
    case repositoryDetails(repository: Repository)

    var defaultStyle: PresentingStyle {
        switch self {
        default:
            return .modal(modalPresentationStyle: .formSheet, animated: true)
        }
    }

    var destination: UIViewController {
        switch self {
        case let .repositoryDetails(repository):
            return RepositoryDetailsConfigurator.repositoryDetailsViewController(repository: repository).viewController
        }
    }
}
