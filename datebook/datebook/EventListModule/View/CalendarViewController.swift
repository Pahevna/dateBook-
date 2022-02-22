//
//  ViewController.swift
//  dateBook
//
//  Created by mac on 21.04.2021.
//

import UIKit    
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {
    
    var presenter: EventListPresenterProtocol?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var calendar: FSCalendar!
    private var emptyLabel: UILabel!
    private var eventsForSelectedDate: [EventModel]?
    private var selectedDate = Date()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
        configureCalendar()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.didSelectDate(selectedDate)
    }
    
    @IBAction func addEvent (_ sender: UIBarButtonItem) {
        presenter?.showEventCreationModule()
    }
    
    private func configureLabel() {
        emptyLabel = UILabel(frame: CGRect(x: 0, y: view.center.y + 60,
                                           width: view.frame.size.width, height: 200))
        emptyLabel.textColor = .black
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        
        view.addSubview(emptyLabel)
}
    
    private func configureCalendar() {
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 60.0,
                                            width: view.frame.size.width, height: 300.0))
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
        Date()
    }
}

extension CalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventsForSelectedDate?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListOfEventsTableViewCell else { return UITableViewCell()}
        
        guard let event = eventsForSelectedDate?[indexPath.row] else { fatalError() }
        
        cell.configureCell(event: event)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64.0
    }
}

extension CalendarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0,
                                                        width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5,
                                  width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        label.text = "Events list"
        label.textAlignment = .center
        label.font = UIFont(name: "TrebuchetMS", size: 17)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        65.0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            guard let eventModel = self.eventsForSelectedDate?[indexPath.row] else { return }
            
            self.eventsForSelectedDate = self.eventsForSelectedDate?.filter { $0 != eventModel }
            self.presenter?.swipeAction(event: eventModel)
            tableView.reloadData()
            
            if indexPath.row == 0 {
                self.showEmptyView(text: "No events for selected date")
            }
        }
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipe
    }
}

extension CalendarViewController: EventListViewProtocol {
  
    func setEvents(_ events: [EventModel]) {
        eventsForSelectedDate = events
        tableView.isHidden = false
        emptyLabel.isHidden = true
        tableView.reloadData()
    }
    
    func showEmptyView(text: String) {
        emptyLabel.text = text
        emptyLabel.isHidden = false
        tableView.isHidden = true
    }
}
