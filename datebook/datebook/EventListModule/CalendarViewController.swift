//
//  ViewController.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import UIKit    
import FSCalendar

class CalendarViewController: UIViewController {
    
    var eventListPresenter: EventListPresenterProtocol? 
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAndAddCalendar()
    }
    
    private func setupAndAddCalendar() {
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: view.frame.size.width,
                                            height: 300.0))
        
        view.addSubview(calendar)
        calendar.scrollDirection = .vertical
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 19.0)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16.0)
        calendar.appearance.todayColor = .systemRed
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.headerTitleColor = .systemRed
        calendar.appearance.weekdayTextColor = .systemRed
        
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.allowsMultipleSelection = true
        
        view.addSubview(calendar)
    }
    
}

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    }
}

extension CalendarViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}
