//
//  PlayerTableViewCell.swift
//  UITextView
//
//  Created by mac on 02.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
