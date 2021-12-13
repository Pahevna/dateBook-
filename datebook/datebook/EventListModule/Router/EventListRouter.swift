//
//  EventListRouter.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation
import UIKit

protocol EventListRouterProtocol {
    var navigationController: UINavigationController { get set }
    func showEventCreationModule()
}

class EventListRouter: EventListRouterProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showEventCreationModule() {
        let eventCreationModuleBuilder = EventCreationModuleBuilder()
        let eventCreationViewController = eventCreationModuleBuilder.buildEventCreationModule(navigationController: navigationController)
        
        navigationController.pushViewController(eventCreationViewController, animated: true)
    }
}
