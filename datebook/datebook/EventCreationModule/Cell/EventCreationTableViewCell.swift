//
//  EventCreationTableViewCell.swift
//  dateBook
//
//  Created by mac on 20.07.2021.
//

import UIKit

class EventCreationTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    
    let cellNameArray = [["Name","Description"],
                         ["Starts","Ends"]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfigure(indexPath: IndexPath) {
        label.text = cellNameArray[indexPath.section][indexPath.row]
    }
}
