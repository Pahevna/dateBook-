//
//  CreateEventViewController.swift
//  dateBook
//
//  Created by mac on 07.06.2021.
//

import UIKit

class EventCreationViewController: UIViewController {
    
    var datePickerIndexPath: IndexPath?
    var inputTexts = ["Starts", "Ends"]
    var inputName = ["Name", "Description"]
    var inputDates: [Date] = []
    var presenter: EventCreationPresenterProtocol?
    
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "TrebuchetMS", size: 17) 
        cancelButton.titleLabel?.textAlignment = .center
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        return cancelButton
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.gray, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "TrebuchetMS", size: 17)
        addButton.titleLabel?.textAlignment = .center
        addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        return addButton
    }()
    
    private let eventLabel = UILabel(text: "New Event", font: UIFont(name: "TrebuchetMS", size: 17), aligment: .center)
      
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .orange
        view.backgroundColor = .systemBackground
        
        setConstraints()
        setupTableView()
        addInitailValues()
    }
    
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [cancelButton,eventLabel,addButton], axis: .horizontal, spacing: 30, distribution: .fillEqually)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func addInitailValues() {
        
        inputDates = Array(repeating: Date(), count: inputTexts.count)
    }
    
    
    private func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
        
        guard let datePickerIndexPath = datePickerIndexPath else { return IndexPath() }
        
        if datePickerIndexPath.row < indexPath.row {
            
            return indexPath
           
       } else {
           
           return IndexPath(row: indexPath.row + 1, section: indexPath.section)
       }
   }

    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        let nibEvent = UINib(nibName: "EventCreationTableViewCell", bundle: nil)
        tableView.register(nibEvent, forCellReuseIdentifier: "cellEvent")
        let nibDate = UINib(nibName: "DateTableViewCell", bundle: nil)
        tableView.register(nibDate, forCellReuseIdentifier: "cellDate")
        let nibDatePicker = UINib(nibName: "DatePickerTableViewCell", bundle: nil)
        tableView.register(nibDatePicker, forCellReuseIdentifier: "cellDatePicker")
    }
    
    @objc private func didTapAdd() {
        
        print("button clicked")
        presenter?.didTapAddButton()
    }
}

extension EventCreationViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .systemGray6
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if datePickerIndexPath != nil {
            return inputTexts.count + 1
            
        } else {
            return inputTexts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let nameCell = tableView.dequeueReusableCell(withIdentifier: "cellEvent", for: indexPath) as! EventCreationTableViewCell
            return nameCell
        
        } else {
        
        
        if datePickerIndexPath == indexPath {
            
            let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "cellDatePicker") as! DatePickerTableViewCell
            datePickerCell.updateCell(date: inputDates[indexPath.row - 1], indexPath: indexPath)
            datePickerCell.delegate = self
            return datePickerCell
            
        } else {
            
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "cellDate") as! DateTableViewCell
            dateCell.updateDate(date: inputDates[indexPath.row])
            return dateCell
        }
    }
}
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if datePickerIndexPath == indexPath {
            
            return DatePickerTableViewCell.cellHeight()
            
        } else {
            
            return DateTableViewCell.cellHeight()
        }
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
            tableView.insertRows(at: [datePickerIndexPath!], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        tableView.endUpdates()
    }
}

extension EventCreationViewController: DatePickerDelegate {
    
    func didChangeDate(date: Date, indexPath: IndexPath) {
        
        inputDates[indexPath.row] = date
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension EventCreationViewController: EventCreationViewProtocol {
    
    func showAlert(text: String) {

        let alert = UIAlertController(title: "Error", message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
