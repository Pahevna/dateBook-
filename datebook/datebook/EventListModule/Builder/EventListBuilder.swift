//
//  EventListBuilder.swift
//  dateBook
//
//  Created by mac on 25.04.2021.
//

import Foundation
import UIKit 

protocol EventListBuilderProtocol {
    func createEventListModule(navigationController: UINavigationController) -> UIViewController
}

class EventListBuilder: EventListBuilderProtocol {
    
    func createEventListModule(navigationController: UINavigationController) -> UIViewController {
        
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalendarViewController") as? CalendarViewController else { return UIViewController() }
        
        let realmService = RealmService()
        let router = EventListRouter(navigationController: navigationController)
        let presenter = EventListPresenter(view: view, realmService: realmService, router: router)
        view.presenter = presenter
        navigationController.setViewControllers([view], animated: false) 

        return view
    }
}
