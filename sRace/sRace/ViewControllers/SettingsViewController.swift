//
//  SettingsViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 10.07.23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet private var TableView: UITableView!
    
    var items = SettingsClass.sharedInfo.initialSettings
    lazy var settings: [TypeOfCell] = items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        
        setupTable()
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(updateUserName(_:)),
            name: NSNotification.Name("updateUserName"),
            object: nil
        )
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func updateUserName(_ notification: Notification) {
        var username = "User"
        if let newName = notification.userInfo?["Имя пользователя"] as? String {
            username = newName
        }
        
        for (index,value) in settings.enumerated() {
            
            if value.type == .nickNameCell{
                settings[index].text = "Your name: \(username)"
                TableView.reloadData()
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupTable() {
        registerCells()
        
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    private func registerCells() {
        let switchNib = UINib(nibName: "Settings", bundle: Bundle.main)
        TableView.register(switchNib, forCellReuseIdentifier: "Settings")
        
        let openNib = UINib(nibName: "OpenSetting", bundle: Bundle.main)
        TableView.register(openNib, forCellReuseIdentifier: "OpenSetting")
        
        let NickNib = UINib(nibName: "NickNameTableViewCell", bundle: Bundle.main)
        TableView.register(NickNib, forCellReuseIdentifier: "NickName")
    }
    
    
    @IBAction func saveChanges(_ sender: Any) {
        items = settings
        SettingsClass.sharedInfo.initialSettings = settings
        
        if let data = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(data, forKey: "settings")
            }
        loadSettings()
        
        TableView.reloadData()
    }
    
    func loadSettings () {
        
        if
            let data = UserDefaults.standard.data(forKey: "settings") as? Data,
            let newItems = try? JSONDecoder().decode([TypeOfCell].self, from: data){
            items = newItems
            print(items)
        }
        
    }
    
    
    
    @IBAction func cancelChanges (_ sender: Any) {
        settings = items
        TableView.reloadData()
    }
    
    
    
    
}

extension SettingsViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch settings[index].type {
        case .openCell : let cell = tableView.dequeueReusableCell(withIdentifier: "OpenSetting", for: indexPath) as! OpenSetting
            
            cell.nameLabel.text = settings[index].text
            return cell
            
        case .switchCell : let cell = tableView.dequeueReusableCell(withIdentifier: "Settings", for: indexPath) as! Settings
            cell.infoLabel.text = settings[index].text
            cell.switcher.isOn = (settings[index].switcher as? Bool) ?? false
            cell.delegate = self
            return cell
            
        case .nickNameCell: let cell = tableView.dequeueReusableCell(withIdentifier: "NickName", for: indexPath) as! NickNameTableViewCell
            cell.nickName.text = settings[index].text
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "NickNameViewController") as! NickNameViewController
        switch settings[indexPath.row].type {
        case .nickNameCell : show(viewController, sender: self)
        default: return
        }
        
    }
    
}

extension SettingsViewController: SettingDelegate {
    func cell(_ cell: Settings, changeValueTo isOn: Bool) {
        guard let index = TableView.indexPath(for: cell)?.row else { return }
        settings[index].switcher = isOn
        cell.delegate = self
    }
    
}

protocol SettingDelegate: AnyObject {
    func cell (_ cell: Settings, changeValueTo isOn: Bool)
}
