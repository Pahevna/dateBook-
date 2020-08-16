//
//  SecondVC.swift
//  UITextView
//
//  Created by mac on 02.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func passData(editBiography: String, ID: Int)
}

class SecondVC: UIViewController, UITextViewDelegate, SecondViewControllerDelegate {
    
    var player: Player?
    
    weak var delegate: SecondViewControllerDelegate?
    
    let familyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 35)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let biographyTextView: UITextView = {
        let myTextView = UITextView()
        myTextView.textAlignment = .center
        myTextView.font = .italicSystemFont(ofSize: 18)
        myTextView.textColor = .purple
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        return myTextView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(familyLabel)
        view.addSubview(biographyTextView)
        
        biographyTextView.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(SecondVC.updateTextView(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(SecondVC.updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        let lastName = player?.lastName ?? ""
        let width = UIScreen.main.bounds.width
        let height = lastName.height(withConstrainedWidth: width, font: familyLabel.font)
        familyLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        familyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        familyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        familyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        familyLabel.text = player?.lastName
        
        let biography = player?.biography ?? ""
        let widthTextView = UIScreen.main.bounds.width
        let heightBiography = biography.height(withConstrainedWidth: widthTextView, font: biographyTextView.font!)
        biographyTextView.heightAnchor.constraint(equalToConstant: heightBiography + 20).isActive = true
        biographyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        biographyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        biographyTextView.topAnchor.constraint(equalTo: familyLabel.bottomAnchor, constant: 10).isActive = true
        
        biographyTextView.text = player?.biography
        
    }
    
    @objc func updateTextView(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardEndFrameScreenCordinates = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardEndFrame = view.convert(keyboardEndFrameScreenCordinates, to: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            biographyTextView.contentInset = UIEdgeInsets.zero
        } else {
            biographyTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardEndFrame.height, right: 0)
        }
        biographyTextView.scrollRangeToVisible(biographyTextView.selectedRange)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let playerID = player?.id else { return false }
        
        if text == "\n" {
            guard let temp = textView.text else { return false }
            delegate?.passData(editBiography: temp, ID: playerID)
            navigationController?.popToRootViewController(animated: true)
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func passData(editBiography: String, ID: Int) {
    }
}
