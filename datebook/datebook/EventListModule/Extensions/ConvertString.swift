//
//  File.swift
//  dateBook
//
//  Created by mac on 07.07.2021.
//

import Foundation

extension String {

    func convertToDate()-> Date {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        guard let date = dateFormatter.date(from: self) else { return Date() }

        return date
    }
}
