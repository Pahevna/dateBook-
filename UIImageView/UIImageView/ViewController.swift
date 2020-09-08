//
//  ViewController.swift
//  UIImageView
//
//  Created by mac on 06.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myButton: UIButton = {
        let myButton = UIButton()
        myButton.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 450, width: 200, height: 31)
        myButton.setTitle("Random image", for: .normal)
        myButton.setTitleColor(.black, for: .highlighted)
        myButton.backgroundColor = .systemBlue
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return myButton
    }()
    
    private let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.backgroundColor = .green
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: UIScreen.main.bounds.width/9, y: 550, width: 300, height: 71)
        return myLabel
    }()
    
    private var myImageView: UIImageView = {
        var myImageView = UIImageView()
        myImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width,
                                                height: UIScreen.main.bounds.height / 2))
        myImageView.layer.cornerRadius = myImageView.frame.size.width / 2
        myImageView.clipsToBounds = true
        return myImageView
    }()
    
    let imageArray = ["1", "2"]
    var countOfImageOne = 0
    var countOfImageTwo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        view.addSubview(myLabel)
        view.addSubview(myImageView)
    }
    
    @objc func pressedButton(_ sender: UIButton) {
        let random = arc4random_uniform(2)
        
        switch random {
        case 0:
            myImageView.image = UIImage(named: imageArray[0])
            countOfImageOne += 1
            myLabel.text = "Image 1 selected \(countOfImageOne) times"
        case 1:
            myImageView.image = UIImage(named: imageArray[1])
            countOfImageTwo += 1
            myLabel.text = "Image 2 selected \(countOfImageTwo) times"
        default:
            break
        }
    }
}
