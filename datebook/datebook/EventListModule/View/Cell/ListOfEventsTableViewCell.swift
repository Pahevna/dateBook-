//
//  ListOfEventsTableViewCell.swift
//  dateBook
//
//  Created by mac on 30.04.2021.
//

import UIKit

class ListOfEventsTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    @IBOutlet weak var eventLabel: UILabel?
    @IBOutlet weak var dateStartLabel: UILabel?
    @IBOutlet weak var dateEndLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(event: EventListModel) {
        eventLabel?.text = event.name
        dateStartLabel?.text = event.dateStart.convertFromTimeStampToString(date: event.dateStart)
        dateEndLabel?.text = event.dateEnd.convertFromTimeStampToString(date: event.dateEnd)
    }
}
