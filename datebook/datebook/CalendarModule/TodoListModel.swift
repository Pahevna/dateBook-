//
//  TodoList.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import Foundation


struct TodoListModel: Decodable {
    let id: Int
    let dateStart: Date
    let dateFinish: Date
    let name: String
    let description: String
}

let json = """
                {
                    "toDoList":
                                [
                                    {
                                        "id" : 1,
                                        "dataStart" : "147600000",
                                        "dataEnd" : "147610000",
                                        "name" : "Sport"
                                        "description" : "playing football on the street",
                                    },
                                    {
                                        "id" : 2,
                                        "dataStart" : "187600000",
                                        "dataEnd" : "187610000",
                                        "name" : "Education"
                                        "description" : "online English lesson",
                                    },
                                    {
                                        "id" : 3,
                                        "dataStart" : "127600000",
                                        "dataEnd" : "127610000",
                                        "name" : "Relaxation"
                                        "description" : "walk in the woods"
                                    }
                                ]
                        }

            """
