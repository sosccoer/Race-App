//
//  SettingManager.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 12.07.23.
//

import Foundation

class SettingsClass {
    
    public static var sharedInfo = SettingsClass()
    
    private init () {}
    
    
    
        var initialSettings: [TypeOfCell] = [
            TypeOfCell(type: .switchCell, text: "надеюсь победа", switcher: true),
            TypeOfCell(type: .switchCell, text: "надеюсь не сосу", switcher: false)

            
        
    ]
    
    
    
    var settings: [TypeOfCell] = []
    var newSettings: [TypeOfCell] = []

    
    func saveSettings () {
        
        newSettings = settings
        settings = newSettings
        
        
        
    }
    
    
    
    
}
