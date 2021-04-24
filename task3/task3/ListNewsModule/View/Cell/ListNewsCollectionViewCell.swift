//
//  DetailCollectionViewCell.swift
//  task3
//
//  Created by mac on 21.01.2021.
//

import UIKit

class ListNewsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Static Property 
    
    static let identifier = "cell"
    
    // MARK: - Public Property
    
    var controller: ListNewsViewController?
 
    // MARK: - Private Properties
    
    private let sectionName: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        label.textColor = UIColor.lightGray
        label.font = UIFont.init(name: "Roboto-Regular", size: 5)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
       }()
    
    private let webTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.init(name: "Roboto-Regular", size: 8)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
       }()
    
    private let webPublicationDate: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        label.textColor = UIColor.lightGray
        label.font = UIFont.init(name: "Roboto-Regular", size: 5)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
       }()
    
    // MARK: - Initialization 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    
    private func addViews() {
        contentView.addSubview(sectionName)
        contentView.addSubview(webTitle)
        contentView.addSubview(webPublicationDate)
        
        sectionName.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        sectionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        webTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        webTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        webTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        webTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        webPublicationDate.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        webPublicationDate.leadingAnchor.constraint(equalTo: sectionName.trailingAnchor,
                                                    constant: 5).isActive = true
        
    }
    
    // MARK: - Public Method
    
    public func setDataToCell(sectionName: String, webTitle: String, webPublicationDate: String,
                              controller: ListNewsViewController) {
        self.sectionName.text = sectionName
        self.webTitle.text = webTitle
        self.webPublicationDate.text = webPublicationDate
        self.controller = controller
    }
}
