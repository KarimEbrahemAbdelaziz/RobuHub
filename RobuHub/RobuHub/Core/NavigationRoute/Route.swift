//
//  Route.swift
//  RobuHub
//
//  Created by KarimEbrahem on 10/27/20.
//

import Foundation
import UIKit

enum PresentingStyle {
    case modal(modalPresentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true)
    case push
}

protocol Route {
    var destination: UIViewController { get }
    var defaultStyle: PresentingStyle { get }
}

protocol NavigationRoute: class {
    func navigateTo(_ route: Route)
}

extension UIViewController: NavigationRoute {
    func navigateTo(_ route: Route) {
        switch route.defaultStyle {
        case let .modal(modalPresentationStyle, animated):
            let destination = route.destination
            destination.modalPresentationStyle = modalPresentationStyle
            present(destination, animated: animated, completion: nil)
        case .push:
            let navigationController = self.navigationController
            navigationController?.pushViewController(route.destination, animated: true)
        }
    }
}
