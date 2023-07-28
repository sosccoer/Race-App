//
//  StatsViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        let CellWithPhoto = UINib(nibName: "PhotoTableViewCell", bundle: Bundle.main)
        TableView.register(CellWithPhoto, forCellReuseIdentifier: "PhotoTableViewCell")
        
        let RegularCell = UINib(nibName: "RegularTableViewCell", bundle: Bundle.main)
        TableView.register(RegularCell, forCellReuseIdentifier: "RegularTableViewCell")
    }
    
    var stats:[TypeOfStats] = [
        TypeOfStats(typeOfCell: .PhotoCell, nickName: "Yuliya Igorevna", score: "2225",imgOfMedal: UIImage(named: "gold")),
        TypeOfStats(typeOfCell: .regullarCell,nickName: "Alex" ,score: "10000", position: "2"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Yuliya", score: "7000",position: "3"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Marina", score: "5000",position: "4"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Vladimir", score: "3000",position: "5"),
        

    ]

}

extension StatsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if stats[index].typeOfCell == .regullarCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegularTableViewCell", for: indexPath) as? RegularTableViewCell  else {return UITableViewCell()}
            
            cell.numberOfPosition.text = stats[index].position
            cell.NickName.text = stats[index].nickName
            cell.score.text = "Score: \(stats[index].score)"
            
            
            return cell
            
            }
        else  {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell else {return UITableViewCell()}
            cell.NameOfWiner.text = stats[index].nickName
            cell.Score.text = "Score: \(stats[index].score)"
            cell.imgOfMedal.image = stats[index].imgOfMedal
            return cell
        }
        
    }
    
    
}
