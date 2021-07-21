//
//  UILabel.swift
//  dateBook
//
//  Created by mac on 21.07.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textAlignment = aligment
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
