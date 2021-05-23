//
//  JsonEventsService.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventService {
    func getEvents(completion: @escaping (Result<[EventModel]?, Error>) -> Void)
}

class JsonEventsService: EventService {
    func getEvents(completion: @escaping (Result<[EventModel]?, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "events", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let event = try JSONDecoder().decode([EventModel].self, from: jsonData)
            completion(.success(event))
        } catch {
            completion(.failure(error))
            print(error.localizedDescription)
        }
    }
}
    

