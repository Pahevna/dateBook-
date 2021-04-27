//
//  Extensions.swift
//  dateBook
//
//  Created by mac on 27.04.2021.
//

import Foundation

extension String {
    func convertFromTimeStampToString(date: Int) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
    
        //let newDate = dateFormatter.
        
        //let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}




//extension String {
//
//    func dateFromISOstringToddMMyyyy(date: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//        guard let newDate = dateFormatter.date(from: date) else {return ""}
//
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let stringDate = dateFormatter.string(from: newDate)
//
//        return stringDate
//    }
//}
