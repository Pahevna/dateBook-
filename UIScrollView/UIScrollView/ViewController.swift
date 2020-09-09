//
//  ViewController.swift
//  UIScrollView
//
//  Created by mac on 31.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

let car = Car(description: "BMW X5 2020 black")
let moto = Motorcycle(description: "Suzuki V-Strom 2019 red")

class ViewController: UIViewController {
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 600, width: 200, height: 31)
        myButton.setTitle("Показать описание", for: .normal)
        myButton.setTitleColor(.black, for: .highlighted)
        myButton.backgroundColor = .systemBlue
        myButton.alpha = 0.5
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return myButton
    }()
    
    private let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: UIScreen.main.bounds.width/9, y: 500, width: 300, height: 71)
        return myLabel
    }()
    
    private let myTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.frame = CGRect(x: UIScreen.main.bounds.width/9, y: 450, width: 300, height: 31)
        myTextField.borderStyle = .roundedRect
        myTextField.placeholder = "Введите ТС"
        myTextField.textAlignment = .center
        myTextField.clearButtonMode = .always
        return myTextField
    }()
    
    let myScrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.height)
        myScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 50)
        return myScrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myScrollView)
        myScrollView.addSubview(myButton)
        myScrollView.addSubview(myTextField)
        myScrollView.addSubview(myLabel)
        myTextField.delegate = self
        registerForKeybordNotifications()
    }
    
    deinit {
        removeKeybordNotifications()
    }
    
    func registerForKeybordNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeybordNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        myScrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide() {
        myScrollView.contentOffset = CGPoint.zero
    }
    
    @objc func pressedButton(_ sender: UIButton) {
        if myTextField.text == "Машина" {
            myLabel.text = car.description
        } else if myTextField.text == "Мотоцикл" {
                myLabel.text = moto.description
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(shouldChangeCharactersIn, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: replacementString)
            myButton.isEnabled = updatedText.isEmpty ? false : true
            myButton.alpha = updatedText.isEmpty ? 0.5 : 1
            
        }
         return true
    }
}
