//
//  EventListTableViewCell.swift
//  dateBook
//
//  Created by mac on 25.04.2021.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
