//
//  AuthAssemblyBuilder.swift
//  task3
//
//  Created by mac on 10.03.2021.
//

import UIKit

protocol AuthAssemblyBuilderProtocol {
    func createAuthModule(navigationController: UINavigationController) -> UIViewController
}

class AuthAssemblyBuilder: AuthAssemblyBuilderProtocol {
    
    func createAuthModule(navigationController: UINavigationController) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as! AuthViewController
        let router = AuthRouter(navigationController: navigationController)
        let presenter = AuthPresenter(view: view, router: router)
        view.presenter = presenter
        navigationController.setViewControllers([view], animated: false)
        
        return view
    }
}
