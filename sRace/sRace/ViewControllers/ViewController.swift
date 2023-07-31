//
//  ViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 8.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let destination = StartViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

