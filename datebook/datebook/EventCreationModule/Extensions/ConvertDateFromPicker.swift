//
//  ConvertDate.swift
//  dateBook
//
//  Created by mac on 17.06.2021.
//

import Foundation

extension Date {
    
    func convertFromDateFromPicker() -> String {
        
        Date.dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        let dateString = Date.dateFormatter.string(from: self)
        
        return dateString
    }
}
