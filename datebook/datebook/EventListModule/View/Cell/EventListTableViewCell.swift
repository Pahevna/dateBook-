//
//  EventListTableViewCell.swift
//  dateBook
//
//  Created by mac on 25.04.2021.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    var controller: CalendarViewController?
    
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setDataToCell(data: String, event: String, controller: CalendarViewController) {
        self.dataLabel?.text = data
        self.eventLabel?.text = event
        self.controller = controller
    }
}
