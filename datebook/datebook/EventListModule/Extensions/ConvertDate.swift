//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension Double {
    
    func convertFromTimeStampToDate() -> Date {
        
        let date = Date(timeIntervalSince1970: self)
        
        return date 
    }

    func convertFromDoubleToString(timeStamp: Double) -> String {
        
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}

