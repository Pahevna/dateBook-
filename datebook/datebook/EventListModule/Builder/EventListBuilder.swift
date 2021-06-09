//
//  EventListBuilder.swift
//  dateBook
//
//  Created by mac on 25.04.2021.
//

import Foundation
import UIKit 

protocol EventListBuilderProtocol {
    static func createEventListModule() -> UIViewController
}

class EventListBuilder: EventListBuilderProtocol {
   
    static func createEventListModule() -> UIViewController {
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        let jsonEventService = JsonEventsService()
        let presenter = EventListPresenter(view: view, jsonEventsService: jsonEventService)
        view.presenter = presenter
        
        return view
    }
}

