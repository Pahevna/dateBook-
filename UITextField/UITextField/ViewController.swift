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
        
        self.createButton()
        self.createTextField()
        
        myTextField.delegate = self
        //self.myTextField.becomeFirstResponder()
    }

    func createButton() {
        let buttonFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        
        myButton = UIButton(frame: buttonFrame)
        myButton.setTitle("Добавить", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        myButton.backgroundColor = .white
        myButton.contentVerticalAlignment = .center
        myButton.center = .init(x: 190, y: 300)
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        view.addSubview(self.myButton)
        
    }
    
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 300, height: 31)
        
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "Введите текст"
        myTextField.center = .init(x: 190, y: 100)
        myTextField.clearButtonMode = .always
        view.addSubview(self.myTextField)
        }
    
    @objc func pressedButton(_ sender: UIButton) {
        textFieldArray.append(myTextField.text!)
        
    }
    
        
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
        }


        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            return true
        }
        

        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            
    }
   

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
   
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool {
            
        if myTextField.text!.isEmpty {
            myButton.isEnabled = false
        } else {
            myButton.isEnabled = true
        }
        
        return true
        
    }
   
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
   

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

