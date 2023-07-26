//
//  StatsModel.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import Foundation
import UIKit

struct TypeOfStats {
var typeOfCell: TypeCellForStats
var nickName: String
var score: Int
var position: Int?
var imgOfMedal: UIImage?
}

enum TypeCellForStats {
    case regullarCell
    case PhotoCell
}
