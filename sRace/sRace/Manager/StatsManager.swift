//
//  StatsManager.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 28.07.23.
//

import Foundation
import UIKit

struct StatsManager {
    
    public static var shareInfo = StatsManager()
    
    private init () {}
    
    
    var previusStats:[TypeOfStats] = [
        TypeOfStats(typeOfCell: .PhotoCell, nickName: "Yuliya Igorevna", score: "2225",imgOfMedal: UIImage(named: "gold")),
        TypeOfStats(typeOfCell: .PhotoCell, nickName: "Yuliya Igorevna", score: "2225",imgOfMedal: UIImage(named: "silver")),
        TypeOfStats(typeOfCell: .PhotoCell, nickName: "Yuliya Igorevna", score: "2225",imgOfMedal: UIImage(named: "bronze")),
        TypeOfStats(typeOfCell: .regullarCell,nickName: "Alex" ,score: "10000", position: "4"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Yuliya", score: "7000",position: "5"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Marina", score: "5000",position: "6"),
        TypeOfStats(typeOfCell: .regullarCell, nickName: "Vladimir", score: "3000",position: "7"),
        

    ]
    
}
