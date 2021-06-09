//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension Date {
    
    static let dateFormatter = DateFormatter()
    
    func convertFromDateToString() -> String {
        
        Date.dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = Date.dateFormatter.string(from: self)
        
        return dateString
    }
}

    extension TimeInterval {
    
    func convertFromTimeStampToString() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        Date.dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = Date.dateFormatter.string(from: date)
        
        return dateString
    }

    func convertFromDoubleToString() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        Date.dateFormatter.dateFormat = "HH:mm"
        let dateString = Date.dateFormatter.string(from: date)
        
        return dateString
    }
}

    

