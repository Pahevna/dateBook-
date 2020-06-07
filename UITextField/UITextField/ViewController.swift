//
//  ViewController.swift
//  UITextField
//
//  Created by mac on 31.05.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func pressedButton(_ sender: Any) {
        textField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

