//
//  FeedItem.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 10.07.23.
//

import Foundation

struct TypeOfCell: Codable {
    
   var type: TypeCell
   var text: String
    var switcher:Bool?
    
}

enum TypeCell: Codable {
    
    case switchCell
    case openCell
    case nickNameCell
    
}




