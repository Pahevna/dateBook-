//
//  CreateEventViewController.swift
//  dateBook
//
//  Created by mac on 07.06.2021.
//

import UIKit

class EventCreationViewController: UIViewController {
    
    var presenter: EventCreationPresenterProtocol?
    var datePickerIndexPath: IndexPath?
    var inputTexts = ["Starts", "Ends"]
    var inputDates: [Date] = []
    
    let idEventCreationCell = "idEventCreationCell"
    let idDateCell = "idDateCell"
    let idDatePickerCell = "idDatePickerCell"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapAdd))
        navigationItem.title = "New Event"
        
        view.backgroundColor = .systemBackground
        
        setConstraints()
        setupTableView()
        addInitailValues()
    }
    
    private func setConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        let nibEvent = UINib(nibName: "EventCreationTableViewCell", bundle: nil)
        tableView.register(nibEvent, forCellReuseIdentifier: idEventCreationCell)
        let nibDate = UINib(nibName: "DateTableViewCell", bundle: nil)
        tableView.register(nibDate, forCellReuseIdentifier: idDateCell)
        let nibDatePicker = UINib(nibName: "DatePickerTableViewCell", bundle: nil)
        tableView.register(nibDatePicker, forCellReuseIdentifier: idDatePickerCell)
    }
    
    private func addInitailValues() {
        inputDates = Array(repeating: Date(), count: inputTexts.count)
    }
    
    private func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
        
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
            return indexPath
        } else {
            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
        }
    }
    
    @objc private func didTapAdd() {
        presenter?.didTapAddButton()
    }
}

extension EventCreationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .systemGray6
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if datePickerIndexPath != nil, section == 1 {
            return inputTexts.count + 1
        } else {
            return inputTexts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let eventCreationCell = tableView.dequeueReusableCell(withIdentifier: idEventCreationCell, for: indexPath) as? EventCreationTableViewCell
            
            if indexPath.row == 0 {
                eventCreationCell?.typeTextField = .name
            } else {
                eventCreationCell?.typeTextField = .description
            }
            
            eventCreationCell?.updateText(indexPath: indexPath)
            eventCreationCell?.completionHandler = { [weak self] (updateText, typeText) in
                
                switch typeText {
                case .name:
                    self?.presenter?.didEditName(updateText)
                default:
                    self?.presenter?.didEditDescription(updateText)
                }
            }
            return eventCreationCell ?? UITableViewCell()
            
        } else {
            
            if datePickerIndexPath == indexPath {
                
                let datePickerCell = tableView.dequeueReusableCell(withIdentifier: idDatePickerCell) as? DatePickerTableViewCell
                
                if indexPath.row == 1 {
                    datePickerCell?.typeDatePicker = .dateStart
                } else {
                    datePickerCell?.typeDatePicker = .dateEnd
                }
                
                datePickerCell?.updateCell(date: inputDates[indexPath.row - 1], indexPath: indexPath)
                datePickerCell?.delegate = self
                
                return datePickerCell ?? UITableViewCell()
                
            } else {
                
                let dateCell = tableView.dequeueReusableCell(withIdentifier: idDateCell) as? DateTableViewCell
                dateCell?.updateText(text: inputTexts[indexPath.row], date: inputDates[indexPath.row])
                
                return dateCell ?? UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        datePickerIndexPath == indexPath ? 162.0 : 44.0
    }
}

extension EventCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        
        if let datePickerIndexPath = datePickerIndexPath,
           datePickerIndexPath.row - 1 == indexPath.row {
            
            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            self.datePickerIndexPath = nil
        
        } else {
            
            if let datePickerIndexPath = datePickerIndexPath {
                
                tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            }
            
            datePickerIndexPath = indexPathToInsertDatePicker(indexPath: indexPath)
            
            guard let datePickerIndexPath = datePickerIndexPath else { return }
            
            tableView.insertRows(at: [datePickerIndexPath], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.endUpdates()
    }
}

extension EventCreationViewController: DatePickerDelegate {
    
    func didChangeDate(date: Date, indexPath: IndexPath) {
        
        inputDates[indexPath.row] = date
        tableView.reloadRows(at: [indexPath], with: .none)
        
        if indexPath.row == 1 {
            presenter?.didEditDateStart(date)
        } else {
            presenter?.didEditDateEnd(date)
        }
    }
}

extension EventCreationViewController: EventCreationViewProtocol {
    
    func showAlert(text: String) {
        let alert = UIAlertController(title: "Error",
                                      message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
