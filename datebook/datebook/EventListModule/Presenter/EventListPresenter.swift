//
//  EventListPresenter.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventListViewProtocol: class {
    func set(events: [EventListModel]?)
}

protocol EventListPresenterProtocol: class {
    func getEvents()
    var events: [EventListModel]? { get }
}

class EventListPresenter: EventListPresenterProtocol {
    weak var view: EventListViewProtocol?
    private let jsonEventsService: EventService
    var events: [EventListModel]?
    let selectedDate = Date()
  
    required init(view: EventListViewProtocol, jsonEventsService: EventService) {
        self.view = view
        self.jsonEventsService = jsonEventsService
        //getEvents()
    }
    
    func getEvents() {
        jsonEventsService.getEvents(for: selectedDate) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let events):
                self.events = events
                //self.view?.set(events: events)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func filterEvents() {
        
        if let filteredEvents = events?.filter({$0.dateEnd.convertFromTimeStampToString(date: $0.dateEnd) == selectedDate.convertFromDateToString(date: selectedDate) }) {
            events = filteredEvents
        }
    }
}
