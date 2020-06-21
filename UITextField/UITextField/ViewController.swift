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
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 200, width: 200, height: 31)
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
        myTextField.frame = CGRect(x: UIScreen.main.bounds.width/9, y: 50, width: 300, height: 31)
        myTextField.borderStyle = .roundedRect
        myTextField.placeholder = "Введите текст"
        myTextField.clearButtonMode = .always
        return myTextField
    }()
        
    var textFieldArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        view.addSubview(myTextField)
        myTextField.delegate = self
    }
    
    @objc func pressedButton(_ sender: UIButton) {
        if myTextField.text?.isEmpty == false {
            textFieldArray.append(myTextField.text!)
        }
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
