//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension Double {
    func convertFromTimeStampToString(date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let timeStamp = Date().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timeStamp)
        let time = Date(timeIntervalSince1970: TimeInterval(myTimeInterval))
        let dateString = dateFormatter.string(from: time)
        
        return dateString
    }
}

extension Date {
    func convertFromDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let today = Date()
        let dateString = dateFormatter.string(from: today)
        
        return dateString
    }
}
