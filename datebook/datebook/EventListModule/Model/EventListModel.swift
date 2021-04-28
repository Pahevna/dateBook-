//
//  TodoList.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import Foundation

struct EventListModel: Decodable {
    let id: Int
    let dataStart: Double
    let dataEnd: Double
    let name: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case name
        case description 
    }
}

