//
//  ListNewRouter.swift
//  task3
//
//  Created by mac on 10.03.2021.
//

import UIKit

protocol ListNewsRouterProtocol {
    var navigationController: UINavigationController { get set }
    func popToRoot()
}

class ListNewsRouter: ListNewsRouterProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
