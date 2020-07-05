//
//  FootballersTableViewCell.swift
//  UITableView
//
//  Created by mac on 01.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class FootballersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
