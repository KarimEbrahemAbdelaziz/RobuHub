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
            return .modal()
        }
    }

    var destination: UIViewController {
        switch self {
        case .repositoryDetails(_):
            return UIViewController()
        }
    }
}
