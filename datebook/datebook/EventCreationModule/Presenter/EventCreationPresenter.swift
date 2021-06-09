//
//  CreateEventPresenter.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation

protocol EventCreationViewProtocol: class {
    
}

protocol EventCreationPresenterProtocol: class {
    
}

class EventCreationPresenter: EventCreationPresenterProtocol {
    weak var view: EventCreationViewProtocol?
    
    required init(view: EventCreationViewProtocol) {
        self.view = view
    }
    
}
