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
    @IBOutlet weak var labelName: UILabel!
    
    var player: TopFootballer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBiography.text = player?.biography
        labelName.text = player?.lastName
    }
}
