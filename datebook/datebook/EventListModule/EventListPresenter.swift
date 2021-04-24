//
//  EventListPresenter.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventListViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol EventListPresenterProtocol: class {
    init(view: EventListViewProtocol, jsonEventsSetvice: EventServiceProtocol)
    func getEvents()
    var events: [EventListModel]? { get set }
}

class EventListPresenter: EventListPresenterProtocol {
    weak var view: EventListViewProtocol?
    let jsonEventsSetvice: EventServiceProtocol!
    var events: [EventListModel]?
    
    required init(view: EventListViewProtocol, jsonEventsSetvice: EventServiceProtocol) {
        self.view = view
        self.jsonEventsSetvice = jsonEventsSetvice
        getEvents()
    }
    
    func getEvents() {
        jsonEventsSetvice.getEvents { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let events):
                self.events = events
                print(events)
            case.failure(let error):
                print(error)
            }
        }
    }
}
