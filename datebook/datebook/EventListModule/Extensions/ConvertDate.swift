//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

let dateFormatter = DateFormatter()

extension TimeInterval {
    
    func convertFromTimeStampToString() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }

    func convertFromDoubleToString() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}

extension Date {
    
    func convertFromDateToString() -> String {
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
}
    

