//
//  TodoList.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import RealmSwift

class EventModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var desc = ""
    @objc dynamic var dateStart = Date()
    @objc dynamic var dateEnd = Date()
}

