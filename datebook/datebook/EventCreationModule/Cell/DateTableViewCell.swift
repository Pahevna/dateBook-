//
//  DateTableViewCell.swift
//  dateBook
//
//  Created by mac on 21.07.2021.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    
    class func cellHeight() -> CGFloat {
        
        return 44.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateDate(date: Date) {
        
        label.text = date.convertFromDateToString(dateFormat: "d MMM yyyy HH:mm")
    }
}
