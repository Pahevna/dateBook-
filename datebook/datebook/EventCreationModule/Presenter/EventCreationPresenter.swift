//
//  CreateEventPresenter.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation

protocol EventCreationViewProtocol: class {
    func set(name: String, dateStart: Date, dateEnd: Date, description: String)
}

protocol EventCreationPresenterProtocol: class {
    func didTapAddButton()
}

class EventCreationPresenter: EventCreationPresenterProtocol {
    
    weak var view: EventCreationViewProtocol?
    private let realmService: RealmServiceProtocol
    
    required init(view: EventCreationViewProtocol, realmService: RealmServiceProtocol) {
        self.view = view
        self.realmService = realmService
    }
    
    func didTapAddButton() {
        realmService.saveEventToRealm(name: <#T##String#>, dateStart: <#T##Date#>, dataEnd: <#T##Date#>, description: <#T##String#>)
    }
    
    
}
