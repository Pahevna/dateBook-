//
//  CreateEventPresenter.swift
//  dateBook
//
//  Created by mac on 09.06.2021.
//

import Foundation

protocol EventCreationViewProtocol: AnyObject {
    func showAlert(title: String, text: String)
}

protocol EventCreationPresenterProtocol: AnyObject {
    func didEditName(_ name: String)
    func didEditDescription(_ description: String)
    func didEditDateStart(_ dateStart: Date)
    func didEditDateEnd(_ dateEnd: Date)
    func didTapAddButton()
    func popToRootViewController() 
}

class EventCreationPresenter: EventCreationPresenterProtocol {
    weak var view: EventCreationViewProtocol?
    var router: EventCreationRouterProtocol?
    private var name = ""
    private var description = ""
    private var dateStart = Date()
    private var dateEnd = Date()
    private let realmService: RealmServiceProtocol
    private let currentDate = Date()
    
    required init(view: EventCreationViewProtocol, realmService: RealmServiceProtocol, router: EventCreationRouterProtocol) {
        self.view = view
        self.realmService = realmService
        self.router = router 
    }
    
    func didEditName(_ name: String) {
       self.name = name
    }
    
    func didEditDescription(_ description: String) {
        self.description = description
    }
    
    func didEditDateStart(_ dateStart: Date) {
        self.dateStart = dateStart
    }
    
    func didEditDateEnd(_ dateEnd: Date) {
        self.dateEnd = dateEnd
    }
    
    func didTapAddButton() {
       
        if name == "" || description == "" {
            view?.showAlert(title: "Error", text: "please, fill all fields")
        }
        
        if dateStart >= dateEnd || dateStart < currentDate || dateEnd < currentDate || dateStart.get(.day) != dateEnd.get(.day) {
            view?.showAlert(title: "Error", text: "incorrect event date")
        } else {
            realmService.saveEventToRealm(name: name,
                                          dateStart: dateStart,
                                          dateEnd: dateEnd,
                                          description: description)
            view?.showAlert(title: "Succes", text: "event created")
        }
    }
    
    func popToRootViewController() {
        router?.popToRoot()
    }
}
