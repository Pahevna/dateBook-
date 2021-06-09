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
        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "TrebuchetMS", size: 17) 
        cancelButton.titleLabel?.textAlignment = .center
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        return cancelButton
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.gray, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "TrebuchetMS", size: 17)
        addButton.titleLabel?.textAlignment = .center
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        return addButton
    }()
    
    private let eventLabel: UILabel = {
        let eventLabel = UILabel()
        eventLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        eventLabel.textColor = .black
        eventLabel.text = "Событие"
        eventLabel.textAlignment = .center
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return eventLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
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
    }
}

extension EventCreationViewController: EventCreationViewProtocol {
    
}
