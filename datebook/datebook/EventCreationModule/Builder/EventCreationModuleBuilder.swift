//
//  CreateEventModuleBuilder.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation
import UIKit

protocol EventCreationModuleBuilderProtocol {
    func buildEventCreationModule(navigationController: UINavigationController) -> UIViewController
}

class EventCreationModuleBuilder: EventCreationModuleBuilderProtocol {
    
    func buildEventCreationModule(navigationController: UINavigationController) -> UIViewController {
        
        let view = EventCreationViewController()
        let realmService = RealmService()
        let presenter = EventCreationPresenter(view: view, realmService: realmService)
        view.presenter = presenter
        
        return view
    }
}

