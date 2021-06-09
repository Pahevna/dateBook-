//
//  CreateEventPresenter.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation

protocol CreateEventViewProtocol: class {
    
}

protocol CreateEventPresenterProtocol: class {
    
}

class CreateEventPresenter: CreateEventPresenterProtocol {
    weak var view: CreateEventViewProtocol?
    
    required init(view: CreateEventViewProtocol) {
        self.view = view
    }
    
}
