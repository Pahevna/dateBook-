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
    
    private let dateStartTextField: UITextField = {
        let dateStartTextField = UITextField()
        dateStartTextField.font = UIFont(name: "TrebuchetMS", size: 17)
        dateStartTextField.placeholder = "Starts"
        dateStartTextField.textAlignment = .left
        dateStartTextField.borderStyle = .roundedRect
        dateStartTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return dateStartTextField
    }()
    
    private let dateEndTextField: UITextField = {
        let dateEndTextField = UITextField()
        dateEndTextField.font = UIFont(name: "TrebuchetMS", size: 17)
        dateEndTextField.placeholder = "Ends"
        dateEndTextField.textAlignment = .left
        dateEndTextField.borderStyle = .roundedRect
        dateEndTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return dateEndTextField
    }()
    
    private let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        configureTextField()
        
        createDatePicker(forField: dateStartTextField)
        createDatePicker(forField: dateEndTextField)
       
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
        
        view.addSubview(dateStartTextField)
        NSLayoutConstraint.activate([
            dateStartTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateStartTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateStartTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor),
            dateStartTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(dateEndTextField)
        NSLayoutConstraint.activate([
            dateEndTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateEndTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateEndTextField.topAnchor.constraint(equalTo: dateStartTextField.bottomAnchor),
            dateEndTextField.heightAnchor.constraint(equalToConstant: 50)
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
    
    private func createDatePicker(forField textField: UITextField) {
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        textField.inputView = datePicker
        textField.inputAccessoryView = createToolBar()
    }
    
    private func configureTextField() {
        
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        dateStartTextField.delegate = self
        dateEndTextField.delegate = self
    }
    
    @objc private func donePressed() {
        
        if dateStartTextField.isFirstResponder {
            
            dateStartTextField.text = "\(datePicker.date)"
            dateStartTextField.text = datePicker.date.convertFromDateToString()
            view.endEditing(true)
        }
        
        if dateEndTextField.isFirstResponder {
            
            dateEndTextField.text = "\(datePicker.date)"
            dateEndTextField.text = datePicker.date.convertFromDateToString()
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
            
        } else if textField === dateStartTextField {
            presenter?.didEditDateStart(updatedText.convertToDate())
            
        } else if textField === dateEndTextField {
            presenter?.didEditDateEnd(updatedText.convertToDate())
        }
       
        return false
        
    }
}

extension EventCreationViewController: EventCreationViewProtocol {
   
    
}
