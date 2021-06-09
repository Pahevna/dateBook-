//
//  EventListPresenter.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventListViewProtocol: class {
    func setEvents(_ events: [EventModel])
    func showEmptyView(text: String)
}

protocol EventListPresenterProtocol: class {
    func didSelectDate(_ date: Date)
    func viewDidLoad()
}

class EventListPresenter: EventListPresenterProtocol {
    weak var view: EventListViewProtocol?
    private let jsonEventsService: EventService
    private var events: [EventModel]?
  
    required init(view: EventListViewProtocol, jsonEventsService: EventService) {
        self.view = view
        self.jsonEventsService = jsonEventsService
    }
    
    func viewDidLoad() {
        
        jsonEventsService.getEvents() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let events):
                self.events = events
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        view?.showEmptyView(text: "Choose a date")
    }
    
    func didSelectDate(_ date: Date) {
        
        let filteredEvents = events?.filter({$0.dateStart.convertFromTimeStampToString() == date.convertFromDateToString() })
        
        if filteredEvents?.count == 0 {
            view?.showEmptyView(text: "No events for selected date")
            
        } else {
            view?.setEvents(filteredEvents ?? [])
        }
    }
}
