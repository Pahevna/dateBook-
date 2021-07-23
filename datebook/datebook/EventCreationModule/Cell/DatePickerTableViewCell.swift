//
//  DatePickerTableViewCell.swift
//  dateBook
//
//  Created by mac on 21.07.2021.
//

import UIKit

protocol DatePickerDelegate: class {
    func didChangeDate(date: Date, indexPath: IndexPath)
}


class DatePickerTableViewCell: UITableViewCell {

    @IBOutlet private weak var datePicker: UIDatePicker!
    
    var indexPath: IndexPath!
    weak var delegate: DatePickerDelegate?
    
    class func cellHeight() -> CGFloat {
    
        return 162.0
    
    }
    
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
        
        let indexPathForDisplayDate = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        delegate?.didChangeDate(date: sender.date, indexPath: indexPathForDisplayDate)
    }
}
