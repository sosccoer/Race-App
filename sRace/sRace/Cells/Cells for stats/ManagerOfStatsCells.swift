//
//  ManagerOfStatsCells.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 19.07.23.
//

import Foundation
import UIKit

struct typeOfStatsCells {
    
    var typeOfCell: TypeCell
    var nameOfWinner: String
    var score: String
    var medal: UIImage?
    var numberOfPosition: Int
    
}

enum TypeCells {
    case RegullarCells
    case CellsWithPhoto
}
