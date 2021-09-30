//
//  DatePickerTableViewCell.swift
//  dateBook
//
//  Created by mac on 06.08.2021.
//

import UIKit

protocol DatePickerDelegate: class {
    func didChangeDate(date: Date, indexPath: IndexPath)
}

class DatePickerTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var indexPath: IndexPath?
    weak var delegate: DatePickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initView() {
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
    }
    
    func updateCell(date: Date, indexPath: IndexPath) {
        datePicker.setDate(date, animated: true)
        self.indexPath = indexPath
    }
    
    @objc func dateDidChange(_ sender: UIDatePicker) {
        
        guard let indexPath = indexPath else { return }
        
        let indexPathForDisplayDate = IndexPath(row: indexPath.row - 1, section: indexPath.section )
        delegate?.didChangeDate(date: sender.date, indexPath: indexPathForDisplayDate)
    }
}
