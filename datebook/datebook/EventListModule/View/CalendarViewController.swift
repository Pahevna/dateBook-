//
//  ViewController.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import UIKit    
import FSCalendar

class CalendarViewController: UIViewController {
    
    var presenter: EventListPresenterProtocol?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var calendar: FSCalendar!
    private var eventsForSelectedDate: [EventModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCalendar()
        setupTableView()
        
        presenter?.viewDidLoad()
    }
    
    private func configureCalendar() {
        
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 60.0, width: view.frame.size.width, height: 300.0))
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
        
    }
    
    private func setupTableView() {
       
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ListOfEventsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

extension CalendarViewController: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
       
        presenter?.didSelectDate(date)
    }
}

extension CalendarViewController: FSCalendarDataSource {
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        
        return Date()
    }
}

extension CalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if eventsForSelectedDate?.count == 0 {
            tableView.setEmptyMessage()
        
        } else {
        
            tableView.restore()
        }
        
        return eventsForSelectedDate?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfEventsTableViewCell
        guard let event = eventsForSelectedDate?[indexPath.row] else { fatalError() }
        
        cell.configureCell(event: event)
    
        return cell
    }
}

extension CalendarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "Events list"
        label.textAlignment = .center
        label.font = UIFont(name: "TrebuchetMS", size: 17)
        
        headerView.addSubview(label)
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
}

extension CalendarViewController: EventListViewProtocol {
 
    func setEvents(_ events: [EventModel]) {
        
        eventsForSelectedDate = events
        tableView.reloadData()
    }
}

extension UITableView {
    
    func setEmptyMessage() {
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = "No events on the selected day"
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        messageLabel.sizeToFit()
        
        backgroundView = messageLabel
        separatorStyle = .none
    }
    
    func restore() {
       
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
