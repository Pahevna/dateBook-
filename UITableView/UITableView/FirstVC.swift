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
        
        let player1 = TopFootballer(fistName: "Gianluigi", lastName: "Buffon", biography: "is an Italian professional footballer who plays as a goalkeeper for Serie A club Juventus. He is widely regarded by players, pundits and managers as one of the greatest goalkeepers of all time, and, by many, as the greatest ever. Buffon holds the record for the longest streak without conceding a goal in Serie A history: over 12 league matches, he went unbeaten for 974 consecutive minutes during the 2015–16 season, achieving the most consecutive clean sheets (10) during that run.")
        let player2 = TopFootballer(fistName: "Cristiano", lastName: "Ronaldo", biography: "is a Portuguese professional footballer who plays as a forward for Serie A club Juventus and captains the Portugal national team. Often considered the best player in the world and widely regarded as one of the greatest players of all time, Ronaldo has won five Ballons d'Or and four European Golden Shoes, both of which are records for a European player.")
        let player3 = TopFootballer(fistName: "Zinedine", lastName: "Zidane", biography: "is a French former professional football player who played as an attacking midfielder. He is the current manager of La Liga club Real Madrid. Widely regarded as one of the greatest players of all time, Zidane was an elite playmaker renowned for his elegance, vision, passing, ball control, and technique. He received many individual accolades as a player, including being named FIFA World Player of the Year in 1998, 2000 and 2003, and winning the 1998 Ballon d'Or.")
        
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
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = SecondVC()
        secondVC.player = array[indexPath.row]
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
