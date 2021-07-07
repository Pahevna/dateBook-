//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension Date {
    
    func convertFromDateToString(dateFormat: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
}
