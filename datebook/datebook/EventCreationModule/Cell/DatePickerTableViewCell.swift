//
//  DatePickerTableViewCell.swift
//  dateBook
//
//  Created by mac on 21.07.2021.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {

    @IBOutlet private weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
