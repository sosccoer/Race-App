//
//  RegularTableViewCell.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit

class RegularTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfPosition: UILabel!
    
    @IBOutlet weak var NickName: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    
    func fillValues (position: Int,name: String,scoreOfPlayer: Int){
        
        numberOfPosition.text = String(position)
        NickName.text = name
        score.text = String(scoreOfPlayer)
        
    }
}
