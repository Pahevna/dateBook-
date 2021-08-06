//
//  EventCreationTableViewCell.swift
//  dateBook
//
//  Created by mac on 20.07.2021.
//

import UIKit

class EventCreationTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var textField: UITextField!
   
    let cellNameArray = ["Name","Description"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateText(indexPath: IndexPath) {
        
        textField.text = cellNameArray[indexPath.row]
    }
}
