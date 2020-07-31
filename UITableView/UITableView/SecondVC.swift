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
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let biographyLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 18)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(familyLabel)
        view.addSubview(biographyLabel)
        
        let lastName = player?.lastName ?? ""
        let width = UIScreen.main.bounds.width
        let height = lastName.height(withConstrainedWidth: width, font: familyLabel.font)
        familyLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        familyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        familyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        familyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        familyLabel.text = player?.lastName
        
        let biography = player?.biography ?? ""
        let widthLabel = UIScreen.main.bounds.width
        let heightLabel = biography.height(withConstrainedWidth: widthLabel, font: biographyLabel.font)
        biographyLabel.heightAnchor.constraint(equalToConstant: heightLabel).isActive = true
        biographyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        biographyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        biographyLabel.topAnchor.constraint(equalTo: familyLabel.bottomAnchor).isActive = true
        
        biographyLabel.text = player?.biography
    }
}
