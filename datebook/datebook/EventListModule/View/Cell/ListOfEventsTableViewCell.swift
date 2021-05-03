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
    
    public func setDataToCell(dateStart: Double, dateEnd: Double, event: String) {
        let dateStartString = dateStart.convertFromTimeStampToString(date: dateStart)
        let dateEndString = dateEnd.convertFromTimeStampToString(date: dateEnd)
        
        self.dateStartLabel?.text = dateStartString
        self.dateEndLabel?.text = dateEndString
        self.eventLabel?.text = event
    }
}
