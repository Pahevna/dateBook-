//
//  ListOfEventsTableViewCell.swift
//  dateBook
//
//  Created by mac on 30.04.2021.
//

import UIKit

class ListOfEventsTableViewCell: UITableViewCell {

    static let identifier = "cell"
    var controller: CalendarViewController?
    
    @IBOutlet weak var eventLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setDataToCell(data: String, event: String, controller: CalendarViewController) {
        self.dateLabel?.text = data
        self.eventLabel?.text = event
        self.controller = controller
    }
}
