//
//  ViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 8.07.23.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func startGame(_ sender: UIButton) {
        let destination = StartViewController()
        navigationController?.pushViewController(destination, animated: true)
       
    }
    
    
    @objc
    func updateUserName(_ notification: Notification) {
        var username = "User"
        if let newName = notification.userInfo?["Имя пользователя"] as? String {
            username = newName
        }
        
        greetingLabel.text = "Hello, \(username)!"
    }
}

