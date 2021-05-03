//
//  TodoList.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import Foundation

struct EventListModel: Decodable {
    let id: Int
    let dateStart: Double
    let dateEnd: Double
    let name: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case name
        case description 
    }
}

