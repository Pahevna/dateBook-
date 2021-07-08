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
    
    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.font = UIFont(name: "TrebuchetMS", size: 17)
        nameTextField.placeholder = "Title"
        nameTextField.textAlignment = .left
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return nameTextField
    }()
    
    private let descriptionTextField: UITextField = {
        let descriptionTextField = UITextField()
        descriptionTextField.font = UIFont(name: "TrebuchetMS", size: 17)
        descriptionTextField.placeholder = "Description"
        descriptionTextField.textAlignment = .left
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionTextField
    }()
    
    private let dateStartLabel: UILabel = {
        let dateStartLabel = UILabel()
        dateStartLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        dateStartLabel.textAlignment = .left
        dateStartLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateStartLabel
    }()
    
    private let dateEndLabel: UILabel = {
        let dateEndLabel = UILabel()
        dateEndLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        dateEndLabel.text = "Ends"
        dateEndLabel.textAlignment = .left
        dateEndLabel.textColor = .gray
        dateEndLabel.layer.borderWidth = 0.5
        dateEndLabel.layer.borderColor = UIColor.gray.cgColor
        dateEndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateEndLabel
    }()
    
    private let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        configureTextField()
        
        createDatePicker(forLabel: dateStartLabel)
        createDatePicker(forLabel: dateEndLabel)
       
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
        
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(descriptionTextField)
        NSLayoutConstraint.activate([
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(dateStartLabel)
        NSLayoutConstraint.activate([
            dateStartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateStartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateStartLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor),
            dateStartLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(dateEndLabel)
        NSLayoutConstraint.activate([
            dateEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateEndLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateEndLabel.topAnchor.constraint(equalTo: dateStartLabel.bottomAnchor),
            dateEndLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createToolBar() -> UIToolbar {
    
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        
        return toolBar
    }
    
    private func createDatePicker(forLabel label: UILabel) {
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        //label.text = datePicker
        //createToolBar()
    }
    
    private func configureTextField() {
        
        nameTextField.delegate = self
        descriptionTextField.delegate = self
    }
    
    @objc private func donePressed() {
        
        if dateStartLabel.isFirstResponder {
            
            dateStartLabel.text = "\(datePicker.date)"
            dateStartLabel.text = datePicker.date.convertFromDateToString(dateFormat: "d MMM yyyy HH:mm")
            view.endEditing(true)
        }
        
        if dateEndLabel.isFirstResponder {
            
            dateEndLabel.text = "\(datePicker.date)"
            dateEndLabel.text = datePicker.date.convertFromDateToString(dateFormat: "d MMM yyyy HH:mm")
            view.endEditing(true)
        }
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
        
        if textField === nameTextField {
            addButton.setTitleColor(.red, for: .normal)
            presenter?.didEditName(updatedText)
            
        } else if textField === descriptionTextField {
            presenter?.didEditDescription(updatedText)
            
        } else if textField === dateStartLabel {
            presenter?.didEditDateStart(updatedText.convertToDate())
            
        } else if textField === dateEndLabel {
            presenter?.didEditDateEnd(updatedText.convertToDate())
        }
       
        return false
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
