//
//  SideViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit
import Lottie

class SideViewController: UIViewController {
    
    
    @IBOutlet weak var animatedContainerView: UIView!
    var animationView: LottieAnimationView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = .init(name: "raceCar")
        animationView.frame = animatedContainerView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animatedContainerView.addSubview(animationView!)
        animationView.play()    }
    

    

}
