//
//  TodoList.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import Foundation

struct EventListModel: Decodable {
    let id: Int
    let dataStart: Date
    let dataEnd: Date
    let name: String
    let description: String
}

