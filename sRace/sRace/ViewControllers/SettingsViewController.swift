//
//  SettingsViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 10.07.23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet private var TableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        let switchNib = UINib(nibName: "Settings", bundle: nil)
        TableView.register(switchNib, forCellReuseIdentifier: "Settings")
        let openNib = UINib(nibName: "OpenSetting", bundle: nil)
        TableView.register(openNib, forCellReuseIdentifier: "OpenSetting")
        
    }
    
    private var items :[TypeOfCell] = [
        TypeOfCell(type: .openCell, text: "Основные"),
        TypeOfCell(type: .switchCell, text: "это свитчер"),
        TypeOfCell(type: .switchCell, text: "Тема"),
        TypeOfCell(type: .openCell, text: "Цвет машины"),
        TypeOfCell(type: .openCell, text: "Основные"),
        TypeOfCell(type: .switchCell, text: "это свитчер"),
        TypeOfCell(type: .switchCell, text: "Тема"),
        TypeOfCell(type: .openCell, text: "Цвет машины"),
        TypeOfCell(type: .openCell, text: "Основные"),
        TypeOfCell(type: .switchCell, text: "это свитчер"),
        TypeOfCell(type: .switchCell, text: "Тема"),
        TypeOfCell(type: .openCell, text: "Цвет машины"),
        TypeOfCell(type: .openCell, text: "Основные"),
        TypeOfCell(type: .switchCell, text: "это свитчер"),
        TypeOfCell(type: .switchCell, text: "Тема"),
        TypeOfCell(type: .openCell, text: "Цвет машины"),

    ]
    

}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        switch item.type {
        case .openCell : let cell = tableView.dequeueReusableCell(withIdentifier: "OpenSetting"  , for: indexPath) as! OpenSetting
            cell.configure(with: item.text)
            return cell
        case .switchCell : let cell = tableView.dequeueReusableCell(withIdentifier: "Settings", for: indexPath) as! Settings
            cell.configure(with: item.text)
            return cell

        }
        
    }
    
    
}
