//
//  EventCreationRouter.swift
//  dateBook
//
//  Created by mac on 07.07.2021.
//

import Foundation
import UIKit

protocol EventCreationRouterProtocol {
    var navigationController: UINavigationController { get set }
    func popToRoot()
}

class EventCreationRouter: EventCreationRouterProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func popToRoot() {
        
        navigationController.popToRootViewController(animated: true)
    }
}
