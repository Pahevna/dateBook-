//
//  ViewController.swift
//  UITableView
//
//  Created by mac on 26.06.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

var array = ["Ronaldo","Zico","Rivaldo","Dida","Dunga","Kaka","Alex","Oscar","Maicon","Pele"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
