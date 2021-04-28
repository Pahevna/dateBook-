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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAndAddCalendar()
        setupTableView()
    }
    
    private func setupAndAddCalendar() {
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 60.0, width: view.frame.size.width,
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
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(EventListTableViewCell.self, forCellReuseIdentifier:
                            EventListTableViewCell.identifier)
    }
}

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        presenter?.getEvents()
    }
}

extension CalendarViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventListTableViewCell.identifier,
                                                 for: indexPath) as! EventListTableViewCell
        let cellData = presenter?.events?[indexPath.row]
        let dataStartString = cellData?.dataStart.convertFromTimeStampToString(date: cellData?.dataStart ?? 0)
        let dataEndString = cellData?.dataEnd.convertFromTimeStampToString(date: cellData?.dataEnd ?? 0)
        cell.setDataToCell(data: dataStartString ?? "data", event: cellData?.name ?? "event", controller: self)

        return cell

    }
}

extension CalendarViewController: EventListViewProtocol {
    func succes() {
        tableView.reloadData() 
    }
    
    func failure(error: Error) {
    }
}
