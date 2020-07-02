//
//  SecondViewController.swift
//  UITableView
//
//  Created by mac on 01.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelBiography: UILabel!
    
    var players: TopFootballers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBiography.text = "\((players?.biography)!)"
    }
}
