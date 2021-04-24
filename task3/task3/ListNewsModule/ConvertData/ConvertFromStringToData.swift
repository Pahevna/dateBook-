//
//  ConvertFromStringToData.swift
//  task3
//
//  Created by mac on 07.02.2021.
//

import Foundation

extension String {
    
    func dateFromISOstringToddMMyyyy(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let newDate = dateFormatter.date(from: date) else {return ""}
    
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = dateFormatter.string(from: newDate)
        
        return stringDate
    }
}
