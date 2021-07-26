//
//  AlertDate.swift
//  dateBook
//
//  Created by mac on 26.07.2021.
//

import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel) -> Void {
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy HH:mm"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 120).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}
