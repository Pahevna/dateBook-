//
//  JsonEventsService.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    func saveEventToRealm(name: String, dateStart: Date, dataEnd: Date, description: String)
    func getEvents(completion: @escaping (Result<Results<EventModel>, Error>) -> Void)
}

class RealmService: RealmServiceProtocol {
    
    private var realm = try! Realm()
    
    func saveEventToRealm(name: String, dateStart: Date, dataEnd: Date, description: String) {
        
        do {
            try realm.write {
                let event = EventModel(value: ["name": name, "desc": description, "dateStart": dateStart, "dateEnd": dataEnd])
                realm.add(event)
            }
            
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func getEvents(completion: @escaping (Result<Results<EventModel>, Error>) -> Void) {
        
        let events: Results<EventModel> = realm.objects(EventModel.self)
        completion(.success(events))
        
        let error = NSError()
        completion(.failure(error))
    }
}
    

