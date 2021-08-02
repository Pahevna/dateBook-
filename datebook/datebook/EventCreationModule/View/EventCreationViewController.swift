//
//  CreateEventViewController.swift
//  dateBook
//
//  Created by mac on 07.06.2021.
//

import UIKit

class EventCreationViewController: UIViewController {
    
    var presenter: EventCreationPresenterProtocol?
    
    let idEventCreationCell = "idEventCreationCell"
    
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
    }
    
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [cancelButton,eventLabel,addButton], axis: .horizontal, spacing: 30, distribution: .fillEqually)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            stackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        let nibEvent = UINib(nibName: "EventCreationTableViewCell", bundle: nil)
        tableView.register(nibEvent, forCellReuseIdentifier: idEventCreationCell)
    }
    
    @objc private func didTapAdd() {
        
        print("button clicked")
    }
}

extension EventCreationViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .systemGray6
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idEventCreationCell, for: indexPath) as? EventCreationTableViewCell
        cell?.cellConfigure(indexPath: indexPath)
    
        return cell ?? EventCreationTableViewCell()
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

extension EventCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as? EventCreationTableViewCell
        
        switch indexPath {
        case [0,0]: alertForCellName(label: cell?.label ?? UILabel(), name: "Event name", placeholder: "Enter event name", button: addButton)
        case [0,1]: alertForCellName(label: cell?.label ?? UILabel(), name: "Event description", placeholder: "Enter event description", button: UIButton())
        case [1,0]: alertDate(label: cell?.label ?? UILabel())
        default:
            alertDate(label: cell?.label ?? UILabel())
        }
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
