//
//  ListOfEventsTableViewCell.swift
//  dateBook
//
//  Created by mac on 30.04.2021.
//

import UIKit

class ListOfEventsTableViewCell: UITableViewCell {
    
    @IBOutlet private var eventLabel: UILabel!
    @IBOutlet private var dateStartLabel: UILabel!
    @IBOutlet private var dateEndLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(event: EventModel) {
        eventLabel?.text = event.name
        dateStartLabel?.text = event.dateStart.convertFromDateToString(dateFormat: "HH:mm")
        dateEndLabel?.text = event.dateEnd.convertFromDateToString(dateFormat: "HH:mm")
        descriptionLabel.text = event.desc 
    }
}
