//
//  FirstVC.swift
//  UITableView
//
//  Created by mac on 15.07.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

var array = [TopFootballer]()

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let footballerTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFootballers()
        view.addSubview(footballerTableView)
        
        footballerTableView.translatesAutoresizingMaskIntoConstraints = false
        footballerTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        footballerTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        footballerTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        footballerTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        footballerTableView.delegate = self
        footballerTableView.dataSource = self
        
        footballerTableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "myCell")
        
    }
    
    func loadFootballers() {
        
        let player1 = TopFootballer(fistName: "Lionel", lastName: "Messi", biography: "is an Argentine professional footballer who plays as a forward and captains both Spanish club Barcelona and the Argentina national team. Often considered the best player in the world and widely regarded as one of the greatest players of all time, Messi has won a record six Ballon d'Or awards")
        let player2 = TopFootballer(fistName: "Cristiano", lastName: "Ronaldo", biography: "is a Portuguese professional footballer who plays as a forward for Serie A club Juventus and captains the Portugal national team. Often considered the best player in the world and widely regarded as one of the greatest players of all time, Ronaldo has won five Ballons d'Or and four European Golden Shoes, both of which are records for a European player")
        let player3 = TopFootballer(fistName: "Zinedine", lastName: "Zidane", biography: "is a French former professional football player who played as an attacking midfielder. He is the current manager of La Liga club Real Madrid")
        
        array.append(player1)
        array.append(player2)
        array.append(player3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        let cellPlayer = array[indexPath.row]
        cell.nameLabel.text = cellPlayer.fistName
        cell.lastNameLabel.text = cellPlayer.lastName
        return cell
        }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
