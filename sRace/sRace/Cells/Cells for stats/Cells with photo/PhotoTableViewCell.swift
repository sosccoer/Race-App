//
//  PhotoTableViewCell.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 19.07.23.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgOfMedal: UIImageView!
    
    
    @IBOutlet weak var NameOfWiner: UILabel!
    
    
    @IBOutlet weak var Score: UILabel!
    
    
    func fillValues (photo: UIImage,name: String,score: Int) {
        
        imgOfMedal.image = photo
        NameOfWiner.text = name
        Score.text = String(score)
        
        
    }
    
}
