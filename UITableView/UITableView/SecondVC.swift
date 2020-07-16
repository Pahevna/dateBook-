//
//  SecondVC.swift
//  UITableView
//
//  Created by mac on 15.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var player: TopFootballer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        let familyLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.italicSystemFont(ofSize: 35)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
          }()
        
        let biographyLabel:UILabel = {
            let label = UILabel()
            label.text = player?.biography 
            label.font = UIFont.italicSystemFont(ofSize: 10)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(familyLabel)
        view.addSubview(biographyLabel)
        
        biographyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        biographyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true 
        
    }
}
