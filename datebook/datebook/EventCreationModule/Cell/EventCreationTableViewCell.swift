//
//  EventCreationTableViewCell.swift
//  dateBook
//
//  Created by mac on 20.07.2021.
//

import UIKit

enum TypeTextField {
    case name
    case description
}

class EventCreationTableViewCell: UITableViewCell {
    var typeTextField = TypeTextField.name
    var completionHandler: ((String, TypeTextField) -> ())?
    
    @IBOutlet weak var textField: UITextField!
   
    let cellNameArray = ["Name","Description"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateText(indexPath: IndexPath) {
        textField.placeholder = cellNameArray[indexPath.row]
    }
}

extension EventCreationTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        completionHandler?(updatedText, typeTextField)
            
        return true 
    }
}
