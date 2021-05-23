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
        
        calendar.allowsMultipleSelection = true
    }
    
    private func setupTableView() {
       
        tableView.dataSource = self
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
        
        return eventsForSelectedDate?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfEventsTableViewCell
        guard let cellData = eventsForSelectedDate?[indexPath.row] else { fatalError() }
        cell.configureCell(event: cellData)
    
        return cell
    }
}

extension CalendarViewController: EventListViewProtocol {
 
    func setEvents(_ events: [EventModel]) {
        eventsForSelectedDate = events
        tableView.reloadData()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "No events for selected date", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

