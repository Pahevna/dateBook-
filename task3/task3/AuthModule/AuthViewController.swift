//
//  ViewController.swift
//  task3
//
//  Created by mac on 22.10.2020.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var logInView: UIView!
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var authViewUserName: AuthView!
    @IBOutlet private weak var authViewPassword: AuthView!
    
    // MARK: - Public Properties
    
    var presenter: AuthPresenterProtocol?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authViewUserName.delegate = self
        authViewPassword.delegate = self
        authViewUserName.typeText = .userName
        authViewPassword.typeText = .password
        
        view.setGradientBackround(colorOne: Constants.colorOneForView,
                                  colorTwo: Constants.colorTwoForView)
        contentView.setGradientBackround(colorOne: Constants.colorOneForContentView,
                                         colorTwo: Constants.colorTwoForContentView)
        logInButton.setGradientBackround(colorOne: Constants.colorOneForButton,
                                         colorTwo: Constants.colorTwoForButton)
    
        makeDesign()
    }
    
    // MARK: - IBAction
    
    @IBAction func didTapLogIn (_ sender: Any) {
        presenter?.didTapLogIn(userName: authViewUserName, password: authViewPassword)
    }
    
    // MARK: - Private Method
    
    private func makeDesign() {
        
        logInButton.layer.cornerRadius = logInButton.frame.size.height/2
        logInButton.layer.masksToBounds = true
        
        logInView.layer.cornerRadius = Constants.cornerRadius
        logInView.clipsToBounds = true
    }
}

// MARK: - Methods AuthViewDelegate

extension AuthViewController: AuthViewDelegate {
    
    func didUpdateText(typeText: TypeText, text: String) {
        presenter?.didUpdateFieldWith(type: typeText, updateText: text)
    }
}

extension AuthViewController: AuthViewProtocol {
    
    func showError(text: String) {
        let alert = UIAlertController(title: "Login problem", message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
