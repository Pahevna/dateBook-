//
//  AuthPresenter.swift
//  task3
//
//  Created by mac on 07.11.2020.
//

import Foundation
import KeychainSwift

protocol AuthViewProtocol: class {
    func showError(text: String)
}

protocol AuthPresenterProtocol: class {
    init (view: AuthViewProtocol, router: AuthRouterProtocol)
    func didUpdateFieldWith(type: TypeText, updateText: String)
    func didTapLogIn(userName: AuthView, password: AuthView)
}

private struct Keys {
    static let password = "myPassword"
    static let userName = "myUserName"
    static let launchedBefore = "launchedBefore"
}

class AuthPresenter: AuthPresenterProtocol {
  
    // MARK: - Public Properties 
    
    weak var view: AuthViewProtocol?
    var router: AuthRouterProtocol?
    var updatedUserName: String?
    var updatedPassword: String?
    var keychain = KeychainSwift()
    let launchedBefore = UserDefaults.standard.bool(forKey: Keys.launchedBefore)
  
    required init(view: AuthViewProtocol, router: AuthRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Methods AuthPresenterProtocol
    
    func didUpdateFieldWith(type: TypeText, updateText: String) {
        
        switch type {
        case .userName:
            updatedUserName = updateText
        case .password:
            updatedPassword = updateText
        }
    }
    
    func didTapLogIn(userName: AuthView, password: AuthView) {
        guard let updatedUserName = updatedUserName,
              let updatedPassword = updatedPassword else { return }
        
        if launchedBefore {
            validate()
            
        } else {

            keychain.set(updatedUserName, forKey: Keys.userName)
            keychain.set(updatedPassword, forKey: Keys.password)
            UserDefaults.standard.set(true, forKey: Keys.launchedBefore)
        }
    }
    
    // MARK: - Private Method
    
    private func validate() {
        let valueUserName = keychain.get(Keys.userName)
        let valuePassword = keychain.get(Keys.password)
        
        if updatedUserName?.count != 0, updatedPassword?.count != 0 {
            
            if valueUserName == updatedUserName, valuePassword == updatedPassword
            {
                router?.showListNews()
            } else {
                view?.showError(text: "Wrong password")
            }
            
        } else {
            view?.showError(text: "Please, enter your password ")
        }
    }
}
