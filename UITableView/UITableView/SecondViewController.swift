//
//  SecondViewController.swift
//  UITableView
//
//  Created by mac on 01.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var player: TopFootballers?

    @IBOutlet weak var labelBiography: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBiography.text = "\(String(describing: player?.biography))"
    }
}
