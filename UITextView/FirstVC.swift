//
//  FirstVC.swift
//  UITextView
//
//  Created by mac on 02.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

var array = [Player]()

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SecondViewControllerDelegate {
    
    func passData(editBiography: String, ID: Int) {
        var indexOfPlayer: Int?
        for (index, player) in array.enumerated() {
            if player.id == ID  {
                indexOfPlayer = index
                break;
            }
        }
        
        guard let indexPlayer = indexOfPlayer else {
            return
        }
        
        array[indexPlayer].biography = editBiography
        footballerTableView.reloadData()
    }
    
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
        
        let player1 = Player(fistName: "Robert",
                                                lastName: "Lewandowski",
                                                biography: "is a Polish professional footballer who plays as a striker for Bayern Munich and is the captain of the Poland national team. He is renowned for his positioning, technique and finishing, and is widely regarded as one of the best strikers of his generation. After being the top scorer in the third and second tiers of Polish football with Znicz Pruszków, he moved to top-flight Lech Poznań, and was the top scorer in the league as they won the 2009–10 Ekstraklasa. In 2010, he transferred to Borussia Dortmund for a reported €4.5 million, where he won honours including two consecutive Bundesliga titles and a season as the league's top goalscorer. In 2013, he earned with Dortmund a spot in the 2013 UEFA Champions League Final, a tournament in which he was the second top goalscorer, behind only Cristiano Ronaldo.",
                                                id: 1)
        let player2 = Player(fistName: "Jadon",
                                                lastName: "Sancho",
                                                biography: "is an English professional footballer who plays as a winger for German Bundesliga club Borussia Dortmund and the England national team. Previously a youth player with Watford and Manchester City, Sancho signed his first senior contract with Dortmund in 2017. In his second season, he established himself as a first-team regular and was named in the 2018–19 Bundesliga Team of the Season. Ahead of the 2019–20 season, Sancho won his first trophy following the DFL-Supercup victory over Bayern Munich. Sancho was part of the England youth team that won the 2017 FIFA U-17 World Cup and made his debut for the senior team in 2018. Sancho was born in Camberwell, Greater London to parents from Trinidad and Tobago. He was raised in Kennington. He became friends with fellow aspiring footballer Reiss Nelson, who lived nearby, after they played together in youth tournaments.",
                                                id: 2)
        let player3 = Player(fistName: "Kevin",
                                                lastName: "De Bruyne",
                                                biography: "is a Belgian professional footballer who plays as a midfielder for Premier League club Manchester City and the Belgian national team. Recognised for his exceptional passing and shooting ability, as well as dribbling, he is considered among the best players in the world, and he has often been described as a complete footballer. De Bruyne has been named in the IFFHS Men's World Team twice, the UEFA Team of the Year twice, the UEFA Champions League Squad of the Season twice, the France Football World XI, and the Bundesliga Team of the Year. He won the Premier League Playmaker of the Season and the Manchester City's Player of the Year twice each, the Bundesliga Player of the Year, the Footballer of the Year in Germany, and the Belgian Sportsman of the Year.",
                                                id: 3)
        
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
        cell.nameLabel.attributedText = makeAttributedString(name: cellPlayer.fistName, family: cellPlayer.lastName)
        return cell
        }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = SecondVC()
        secondVC.player = array[indexPath.row]
        secondVC.player?.id = array[indexPath.row].id
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.delegate = self
    }
    
    func makeAttributedString(name: String, family: String) -> NSMutableAttributedString {
        let nameAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 35),
                              NSAttributedString.Key.foregroundColor: UIColor.purple]
        let familyAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 35),
                                NSAttributedString.Key.foregroundColor: UIColor.darkText]

        let nameString = NSMutableAttributedString(string: name + " ", attributes: nameAttributes)
        let familyString = NSMutableAttributedString(string: family, attributes: familyAttributes)
        
        nameString.append(familyString)

        return nameString
    }
}
