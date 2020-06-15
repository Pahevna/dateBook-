//
//  ViewController.swift
//  UITextField
//
//  Created by mac on 31.05.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myButton = UIButton()
    var myTextField = UITextField()
    var textFieldArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()
        createTextField()
        myTextField.delegate = self
    }

    func createButton() {
        let buttonFrame = CGRect(x: UIScreen.main.bounds.width/4, y: 200, width: 200, height: 31)
        
        myButton = UIButton(frame: buttonFrame)
        myButton.setTitle("Добавить", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.backgroundColor = .white
        myButton.contentVerticalAlignment = .center
        //myButton.isEnabled = false
        myButton.alpha = 0.5
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        view.addSubview(self.myButton)
        
    }
    
    func createTextField() {
        let textFieldFrame = CGRect(x: UIScreen.main.bounds.width/9, y: 50, width: 300, height: 31)
        
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "Введите текст"
        myTextField.clearButtonMode = .always
        view.addSubview(self.myTextField)
        }
    
    @objc func pressedButton(_ sender: UIButton) {
        if myTextField.text != "" {
            textFieldArray.append(myTextField.text!)
        } else {
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool {
        
        
        if let text = myTextField.text,
            let textRange = Range(shouldChangeCharactersIn, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: replacementString)
            if updatedText.isEmpty {
                myButton.isEnabled = false
                myButton.alpha = 0.5
            } else {
                myButton.isEnabled = true
                myButton.alpha = 1.0
                
            }
        }
         return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.isEmpty == false {
            textFieldArray.append(textField.text!)
        } else {
        }
        textField.resignFirstResponder()
        return true
    }
}

