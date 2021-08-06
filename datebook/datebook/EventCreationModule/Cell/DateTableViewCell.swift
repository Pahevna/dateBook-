//
//  DateTableViewCell.swift
//  dateBook
//
//  Created by mac on 06.08.2021.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
//    let cellNameArray = ["Starts","Ends"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateText(text: String, date: Date) {
        
        label.text = text 
        dateLabel.text = date.convertFromDateToString(dateFormat: "d MMM yyyy HH:mm")
    }
}
