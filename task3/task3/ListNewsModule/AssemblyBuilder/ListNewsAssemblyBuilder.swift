//
//  ListNewAssemblyBuilder.swift
//  task3
//
//  Created by mac on 10.03.2021.
//

import UIKit

protocol ListNewsAssemblyBuilderProtocol {
    func createListNewsModule(navigationController: UINavigationController) -> UIViewController
}
    
class ListNewsAssemblyBuilder: ListNewsAssemblyBuilderProtocol {
    
    func createListNewsModule(navigationController: UINavigationController) -> UIViewController {
        let view = ListNewsViewController()
        let networkService = NetworkService()
        let presenter = ListNewsPresenter(view: view, networkService: networkService)
        view.listNewsPresenter = presenter
        
        return view
    }
}

