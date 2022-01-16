//
//  EventListPresenterTest.swift
//  dateBookTests
//
//  Created by mac on 09.01.2022.
//

import XCTest
@testable import dateBook

class MockView: EventListViewProtocol {
    func setEvents(_ events: [EventModel]) {
    }

    func showEmptyView(text: String) {
    }
}

class MockRealmService: RealmServiceProtocol {
    var events: [EventModel]!

    init() {}

    convenience init(events: [EventModel]?) {
        self.init()
        self.events = events
    }

    func saveEventToRealm(name: String, dateStart: Date, dateEnd: Date, description: String) {
    }
    
    func getEvents(selectedDate: Date, completion: @escaping (Result<[EventModel]?, Error>) -> Void) {
        if let events = events {
            completion(.success(events))
        } else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

class EventListPresenterTest: XCTestCase {

    var view: MockView!
    var presenter: EventListPresenter!
    var realmService: RealmServiceProtocol!
    var router: EventListRouterProtocol!
    var events = [EventModel]()
    var currentDate = Date()
    
    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        router = EventListRouter(navigationController: navigationController)
    }
    
    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        realmService = nil
    }
    
    func testGetSuccesEvents() {
        let event = EventModel(value: ["name": "Foo", "desc": "Baz", "dateStart": Date(), "dateEnd": Date()])
        events.append(event)
        
        view = MockView()
        realmService = MockRealmService(events: [event])
        presenter = EventListPresenter(view: view, realmService: realmService, router: router)
        
        var catchEvents: [EventModel]?
        
        realmService.getEvents(selectedDate: currentDate) { result in
            switch result {
            case .success(let events):
                catchEvents = events
            case.failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchEvents?.count, 0)
        XCTAssertEqual(catchEvents?.count, events.count)
    }

    func testGetFailureEvents() {
        let event = EventModel(value: ["name": "Foo", "desc": "Baz", "dateStart": Date(), "dateEnd": Date()])
        events.append(event)
        
        view = MockView()
        realmService = MockRealmService()
        presenter = EventListPresenter(view: view, realmService: realmService, router: router)
        
        var catchError: Error?
        
        realmService.getEvents(selectedDate: currentDate) { result in
            switch result {
            case .success( _):
                break
            case.failure(let error):
                catchError = error
            }
        }
        XCTAssertNotNil(catchError)
    }
}
