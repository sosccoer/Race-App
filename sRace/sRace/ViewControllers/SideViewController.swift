//
//  SideViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 26.07.23.
//

import UIKit
import Lottie

class SideViewController: UIViewController {
    
    @IBOutlet weak var AboutAppTextView: UITextView!
    
    @IBOutlet weak var animatedContainerView: UIView!
    
    var animationView: LottieAnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAnimation()
        
        setupNSAttributedString()
    }
    
    
    func playAnimation(){
        animationView = .init(name: "raceCar")
        animationView.frame = animatedContainerView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animatedContainerView.addSubview(animationView!)
        animationView.play()
    }
    
    func setupNSAttributedString() {
        
        guard let myFont = UIFont(name: "BetterVCR", size: 15) else {return}
        
        var text = AttributedString(stringLiteral: "This app is about Volkswagen Beatle")
        
        text.font = myFont
        
        AboutAppTextView.attributedText = NSAttributedString(text)
        
        
        
    }
    
}
