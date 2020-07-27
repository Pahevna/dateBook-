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
    
    let familyLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 35)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let biographyLabel:UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(familyLabel)
        view.addSubview(biographyLabel)
        
        familyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -240).isActive = true
        familyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        familyLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        familyLabel.text = player?.lastName
        
        biographyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        biographyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        biographyLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        biographyLabel.text = player?.biography
    }
}
