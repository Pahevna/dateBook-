//
//  CreateEventModuleBuilder.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation
import UIKit

protocol CreateEventModuleBuilderProtocol {
    func buildСreateEventModele(navigationController: UINavigationController) -> UIViewController
}

class CreateEventModuleBuilder: CreateEventModuleBuilderProtocol {
    
    func buildСreateEventModele(navigationController: UINavigationController) -> UIViewController {
        
        let view = CreateEventViewController()
        let presenter = CreateEventPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
}

