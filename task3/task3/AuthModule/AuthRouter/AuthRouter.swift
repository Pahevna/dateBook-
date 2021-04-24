//
//  AuthRouter.swift
//  task3
//
//  Created by mac on 10.03.2021.
//

import UIKit

protocol AuthRouterProtocol {
    var navigationController: UINavigationController { get set }
    func showListNews()
}

class AuthRouter: AuthRouterProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showListNews() {
        let listNewsAssemblyBuilder = ListNewsAssemblyBuilder()
        let detailViewController = listNewsAssemblyBuilder.createListNewsModule(navigationController: navigationController)
            
        navigationController.pushViewController(detailViewController, animated: true)
        
    }
}
