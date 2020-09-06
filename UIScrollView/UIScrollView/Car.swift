//
//  Car.swift
//  UIScrollView
//
//  Created by mac on 01.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

protocol DescriptionClass {
    var description: String { get }
}

class Car: DescriptionClass {
    var description: String
    
    init(description: String) {
        self.description = description
    }
}
