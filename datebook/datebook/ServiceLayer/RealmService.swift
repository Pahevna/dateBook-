//
//  JsonEventsService.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    func writeEventToRealm(name: String, dateStart: NSDate, dataEnd: NSDate, description: String)
    func readEventFromRealm()

    
}

class RealmService: RealmServiceProtocol {
    
    func writeEventToRealm(name: String, dateStart: NSDate, dataEnd: NSDate, description: String) {
        
        do {
            let realm = try Realm()
            try realm.write {
                let event = EventModel(value: ["name": name, "desc": description, "dateStart": dateStart, "dateEnd": dataEnd])
                realm.add(event)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func readEventFromRealm() {
        
    }
    
}
    

