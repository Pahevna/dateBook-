//
//  ConvertDate.swift
//  dateBook
//
//  Created by mac on 17.06.2021.
//

import Foundation

extension Date {
    
    func convertFromDatePickerToString() -> String {
        
        Date.dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        let dateString = Date.dateFormatter.string(from: self)
        
        return dateString
    }
}
extension String {

    func convertToDate()-> Date {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        guard let date = dateFormatter.date(from: self) else { return Date() }

        return date

    }
}
