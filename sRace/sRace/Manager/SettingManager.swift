//
//  SettingManager.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 12.07.23.
//
import Foundation

class SettingsClass  {
    
    public static var sharedInfo = SettingsClass()
    
    private init () {}
    
    var initialSettings: [TypeOfCell] = [
        
        TypeOfCell(type: .switchCell, text: "Тени", switcher: true),
        TypeOfCell(type: .openCell, text: "Графика"),
        TypeOfCell(type: .nickNameCell, text: "Имя пользователя"),
        TypeOfCell(type: .switchCell, text: "Звук", switcher: false),
        TypeOfCell(type: .openCell, text: "Улучшения")
        
    ]
    
    
    
    
    
}










