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
        dateFormatter.dateFormat = "hh-mm a"
        let timeStamp = Date().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timeStamp)
        let time = Date(timeIntervalSince1970: TimeInterval(myTimeInterval))
        let dateString = dateFormatter.string(from: time)
        
        return dateString
    }
}
