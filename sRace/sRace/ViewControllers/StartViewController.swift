//
//  StartViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 15.07.23.
//

import UIKit

class StartViewController: UIViewController {
        
    // MARK: - Images
    var carImage = UIImageView(image: UIImage(named: "car"))
    var treeImage = UIImageView(image: UIImage(named: "tree"))
    var pitImage = UIImageView(image: UIImage(named: "pit"))
    var rockImage = UIImageView(image: UIImage(named: "Rock"))
    var roadImage = UIImageView(image: UIImage(named: "RoadForsRace"))
    
    // MARK: - Coordinates
    var screenHeight: CGFloat = 0
    var screenWidth:CGFloat = 0
    
    let treeTopSpacing: CGFloat = 700
    let rockTopSpacing: CGFloat = 800
    let pitTopSpacing: CGFloat = 500
    let treeBottomSpacing: CGFloat = 250
    let rockBottomSpacing: CGFloat = 400
    let pitBottomSpacing: CGFloat = 200
    
    // pit - 700
    // rock - 1400
    // tree - 950
    
    let obstaclesSpeed: CGFloat = 250
    
    
    
    var elementSize: CGFloat = 0
    var leftOriginCoordinate: CGFloat = 0
    var rightOriginCoordinate: CGFloat = 0
    var centreOriginCoordinate: CGFloat = 0
    
    var defaultPadding: CGFloat = 62
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lSwipe = UISwipeGestureRecognizer()
        lSwipe.direction = .left
        lSwipe.addTarget(self, action: #selector(swipe))
        
        let rSwipe = UISwipeGestureRecognizer()
        rSwipe.direction = .right
        rSwipe.addTarget(self, action: #selector(swipe))
        
        view.addGestureRecognizer(lSwipe)
        view.addGestureRecognizer(rSwipe)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCoorditates()
        setupFrames()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateObstacles()
    }
    
    func setupCoorditates () {
        
        screenWidth = view.frame.size.width
        
        elementSize = screenWidth / 4
        
        leftOriginCoordinate = elementSize / 4
        centreOriginCoordinate = elementSize + 2 * leftOriginCoordinate
        rightOriginCoordinate = elementSize * 2 + leftOriginCoordinate * 3
        
    }
    
    func setupFrames () {
        
        screenHeight = view.frame.size.height
        let bottomPanding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        let topPanding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        let yCoordinateOfCar = screenHeight - bottomPanding - defaultPadding - elementSize
        let yCoordinateOfTree = -elementSize
        let yCoordinateOfPit = -elementSize
        let yCoordinateOfRock = -elementSize - (screenHeight / 2)
                
        rockImage.frame = CGRect(x: centreOriginCoordinate, y: yCoordinateOfRock, width: elementSize, height: elementSize)
        carImage.frame = CGRect(x: centreOriginCoordinate, y: yCoordinateOfCar, width: elementSize, height: elementSize  )
        treeImage.frame = CGRect(x: leftOriginCoordinate , y: yCoordinateOfTree, width: elementSize , height: elementSize)
        pitImage.frame = CGRect(x: rightOriginCoordinate, y: yCoordinateOfPit, width: elementSize, height: elementSize)
        roadImage.frame = CGRect(x: 0, y: topPanding, width: screenWidth, height: screenHeight - topPanding)
        
        view.addSubview(roadImage)
        view.addSubview(carImage)
        view.addSubview(treeImage)
        view.addSubview(pitImage)
        view.addSubview(rockImage)
        
    }
    
    // MARK: - Swipe
    @objc func swipe (sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
            
        case .left: left(image:carImage)
        case .right:right(image: carImage)
            
        default : break
            
        }
    }
    
    func left (image:UIImageView) {
        
        UIView.animate(withDuration: 1) { [weak self] in
            
            if image.frame.origin.x == self?.rightOriginCoordinate {
                
                image.frame.origin.x = self?.centreOriginCoordinate ?? 0
                
            }else if image.frame.origin.x == self?.centreOriginCoordinate{
                image.frame.origin.x = self?.leftOriginCoordinate ?? 0
            }else {
                image.frame.origin.x = self?.leftOriginCoordinate ?? 0
            }
        }
    }
    
    func right(image:UIImageView) {
        
        UIView.animate(withDuration: 1) { [weak self] in
            
            if image.frame.origin.x == self?.rightOriginCoordinate {
                
                image.frame.origin.x = self?.rightOriginCoordinate ?? 0
                
            }else if image.frame.origin.x == self?.centreOriginCoordinate{
                image.frame.origin.x = self?.rightOriginCoordinate ?? 0
            }else {
                image.frame.origin.x = self?.centreOriginCoordinate ?? 0
            }
        }
    }
    
    // MARK: - Animate Obstacles
    
    func animateObstacles() {
        
        let treeS = screenHeight + treeTopSpacing + treeBottomSpacing
        let rockS = screenHeight + rockTopSpacing + rockBottomSpacing
        let pitS = screenHeight + pitTopSpacing + pitBottomSpacing
        
        let treeT = treeS / obstaclesSpeed
        let rockT = rockS / obstaclesSpeed
        let pitT = pitS / obstaclesSpeed
        
        
        
        
        UIView.animate(withDuration: treeT, delay: 0, options: [.curveLinear,.repeat]) { [weak self] in
            self?.treeImage.frame.origin.y = treeS
        }
        
        UIView.animate(withDuration: pitT, delay: 0,options: [.curveLinear,.repeat] ) { [weak self] in
            
            self?.pitImage.frame.origin.y = pitS
            
        }
        
        UIView.animate(withDuration: rockT, delay: 0,options: [.curveLinear,.repeat]) { [weak self] in
            self?.rockImage.frame.origin.y = rockS
            
        }
        
    }
    
}
