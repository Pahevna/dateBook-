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
    private var emptyLabel: UILabel!
    private var eventsForSelectedDate: [EventModel]?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
        configureCalendar()
        setupTableView()
        presenter?.viewDidLoad()
        
    }
    
    private func configureLabel() {
        
        emptyLabel = UILabel(frame: CGRect(x: 0, y: view.center.y + 60, width: view.frame.size.width, height: 200))
        emptyLabel.textColor = .black
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        
        view.addSubview(emptyLabel)
}
    
    private func configureCalendar() {
        
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 60.0, width: view.frame.size.width, height: 300.0))
        calendar.scrollDirection = .vertical
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 19.0)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16.0)
        calendar.appearance.todayColor = .systemOrange
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.headerTitleColor = .systemOrange
        calendar.appearance.weekdayTextColor = .systemOrange
        
        view.addSubview(calendar)
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
    
    func showInitialEmptyView(text: String) {
       
        emptyLabel.text = text
        emptyLabel.isHidden = false
        tableView.isHidden = true
    }
    
    func hideInitialEmptyView() {
        
        tableView.isHidden = false
        emptyLabel.isHidden = true
    }
}
