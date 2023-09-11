//
//  URLManager .swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 4.09.23.
//

import Foundation

class URLManager {
    
    static func getValuesNames() -> [String] {
        guard let arrayOfData = UserDefaults.standard.array(forKey: "savedValuesNames"),
              let result = arrayOfData as? [String] else { return [] }
        return result
    }
    
    static func addValuesName(_ name: String) {
        let currentNames = getValuesNames()
        UserDefaults.standard.set(currentNames + [name], forKey: "savedValuesNames")
    }
    
    static func deleteAll() {
        UserDefaults.standard.removeObject(forKey: "savedValuesNames")
    }
}
