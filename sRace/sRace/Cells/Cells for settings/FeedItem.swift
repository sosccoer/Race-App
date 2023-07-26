//
//  FeedItem.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 10.07.23.
//

import Foundation

struct TypeOfCell{
    
   var type: TypeCell
   var text: String
    var switcher:Any?
    
}

enum TypeCell {
    
    case switchCell
    case openCell
    case nickNameCell
    
}




