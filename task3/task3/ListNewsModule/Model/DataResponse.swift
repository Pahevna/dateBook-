//
//  News.swift
//  task3
//
//  Created by mac on 19.01.2021.
//

import Foundation

struct DataResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case response
    }
    
    let item: Item?
    
    init(from decoder: Decoder)
    
    throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let item = try? values.decode(Item.self, forKey: .response) {
            self.item = item
        } else {
            item = nil
        }
    }
}

struct Item: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
    var news: [News]?
    var currentPage: Int = 1
    
    init(from decoder: Decoder)
    
    throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let decodeObject = try? values.decode([News].self, forKey: .results) {
            news = decodeObject
            
        } else {
            print("Error decode")
        }
    }
}

struct News: Decodable {
    var sectionName: String?
    var webPublicationDate: String?
    var webTitle: String
}
