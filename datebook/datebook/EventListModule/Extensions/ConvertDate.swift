//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension Double {
    
    func convertFromTimeStampToString(timeStamp: Double) -> String {
        
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func convertFromDoubleToString(timeStamp: Double) -> String {
        
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}

extension Date {
    
    func convertFromDateToString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a" 
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
}
