//
//  JsonEventsService.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    func saveEventToRealm(name: String, dateStart: Date, dateEnd: Date, description: String)
    func getEvents(selectedDate: Date, completion: @escaping (Result<[EventModel]?, Error>) -> Void)
}

class RealmService: RealmServiceProtocol {
    
    func saveEventToRealm(name: String, dateStart: Date, dateEnd: Date, description: String) {
        
        do {
            let realm = try Realm()
            try realm.write {
                let event = EventModel(value: ["name": name,
                                               "desc": description,
                                               "dateStart": dateStart,
                                               "dateEnd": dateEnd])
                realm.add(event)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func getEvents(selectedDate: Date, completion: @escaping (Result<[EventModel]?, Error>) -> Void) {
        
        do {
            let realm = try Realm()
            let events = realm.objects(EventModel.self)
            
            let filteredEvents = Array(events.filter { $0.dateStart.convertFromDateToString(dateFormat: "MM/dd/yyyy") == selectedDate.convertFromDateToString(dateFormat: "MM/dd/yyyy") })
            completion(.success(filteredEvents))
            
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
}
