//
//  CreateEventViewController.swift
//  dateBook
//
//  Created by mac on 07.06.2021.
//

import UIKit

class EventCreationViewController: UIViewController {
    
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
    
    private let eventLabel: UILabel = {
        let eventLabel = UILabel()
        eventLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        eventLabel.textColor = .black
        eventLabel.text = "New Event"
        eventLabel.textAlignment = .center
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return eventLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

//    private let datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.preferredDatePickerStyle = .wheels
//        datePicker.addTarget(self, action: #selector(donePressed), for: .valueChanged)
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//
//        return datePicker
//    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        configureTableView()
    
        navigationController?.navigationBar.tintColor = .orange
        view.backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        view.addSubview(eventLabel)
        NSLayoutConstraint.activate([
            eventLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: 10),
            eventLabel.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: -10),
            eventLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            eventLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
//    @objc private func donePressed() {
//
//        dateStartLabel.text = "\(datePicker.date)"
//        dateStartLabel.text = datePicker.date.convertFromDateToString(dateFormat: "d MMM yyyy HH:mm")
//    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "EventCreationTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellEvent")
    }
    
    @objc private func didTapAdd() {
        
        print("button clicked")
        presenter?.didTapAddButton()
    }
}

extension EventCreationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        textField.text = updatedText
        
//        if textField === nameTextField {
//            addButton.setTitleColor(.red, for: .normal)
//            presenter?.didEditName(updatedText)
//
//        } else if textField === descriptionTextField {
//            presenter?.didEditDescription(updatedText)
//
//        } else if textField === dateStartLabel {
//            presenter?.didEditDateStart(updatedText.convertToDate())
//
//        } else if textField === dateEndLabel {
//            presenter?.didEditDateEnd(updatedText.convertToDate())
//        }
       
        return false
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
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellEvent", for: indexPath) as! EventCreationTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
}

extension EventCreationViewController: UITableViewDelegate {
    
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
