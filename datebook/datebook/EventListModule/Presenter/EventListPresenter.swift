//
//  EventListPresenter.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventListViewProtocol: AnyObject {
    func setEvents(_ events: [EventModel])
    func showEmptyView(text: String)
}

protocol EventListPresenterProtocol: AnyObject {
    func didSelectDate(_ date: Date)
    func viewDidLoad()
    func swipeAction(event: EventModel)
    func showEventCreationModule()
}

class EventListPresenter: EventListPresenterProtocol {
    weak var view: EventListViewProtocol?
    var router: EventListRouterProtocol?
    private let realmService: RealmServiceProtocol
    private var events: [EventModel]?
    private var currentDate = Date()
    
    required init(view: EventListViewProtocol, realmService: RealmServiceProtocol, router: EventListRouterProtocol) {
        self.view = view
        self.realmService = realmService
        self.router = router
    }
    
    func viewDidLoad() {
        realmService.getEvents(selectedDate: currentDate) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let events):
                self.events = events
                self.view?.setEvents(events ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        view?.showEmptyView(text: "Choose a date")
    }
    
    func didSelectDate(_ date: Date) {
        realmService.getEvents(selectedDate: date) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case.success(let events):
                self.events = events
                self.view?.setEvents(events ?? [])
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        if events?.count == 0 {
            view?.showEmptyView(text: "No events for selected date")
        }
    }
    
    func swipeAction(event: EventModel) {
        realmService.deleteEvent(event)
    }
    
    func showEventCreationModule() {
        router?.showEventCreationModule()
    }
}
