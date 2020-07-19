//
//  PlayerTableViewCell.swift
//  UITableView
//
//  Created by mac on 16.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
          
    let lastNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(lastNameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        lastNameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 140).isActive = true
        lastNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
