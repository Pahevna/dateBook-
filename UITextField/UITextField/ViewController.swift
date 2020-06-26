//
//  ViewController.swift
//  UITextField
//
//  Created by mac on 31.05.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
        
    let myButton: UIButton = {
        let myButton = UIButton()
        myButton.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 600, width: 200, height: 31)
        myButton.setTitle("Добавить", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.backgroundColor = .white
        myButton.contentVerticalAlignment = .center
        myButton.alpha = 0.5
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return myButton
    }()
    
    let myTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.frame = CGRect(x: UIScreen.main.bounds.width/9, y: 450, width: 300, height: 31)
        myTextField.borderStyle = .roundedRect
        myTextField.placeholder = "Введите текст"
        myTextField.clearButtonMode = .always
        return myTextField
    }()
    
    let myScrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.height)
        myScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 50)
        return myScrollView
    }()
    
    var textFieldArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myScrollView)
        myScrollView.addSubview(myButton)
        myScrollView.addSubview(myTextField)
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
        guard let text = myTextField.text, !text.isEmpty else {
            return
        }
        textFieldArray.append(text)
        myTextField.resignFirstResponder()
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        textFieldArray.append(text)
        textField.resignFirstResponder()
        return true
        }
    }
