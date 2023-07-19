//
//  StartViewController.swift
//  sRace
//
//  Created by lelya.rumynin@gmail.com on 15.07.23.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var SegmentController: UISegmentedControl!
    
    
    var carImage = UIImageView(image: UIImage(named: "car"))
    var treeImage = UIImageView(image: UIImage(named: "tree"))
    var pitImage = UIImageView(image: UIImage(named: "pit"))
    var roadImage = UIImageView(image: UIImage(named: "RoadForsRace"))
    
    var screenHeight: CGFloat = 0
    var screenWidth:CGFloat = 0
    
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
        changeCarPosition(SegmentController)
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
        let yCoordinateOfTree = screenHeight - bottomPanding - defaultPadding * 4 - elementSize * 3
        let yCoordinateOfPit = yCoordinateOfTree - elementSize - defaultPadding
        
        SegmentController.selectedSegmentIndex = 1
        
        carImage.frame = CGRect(x: centreOriginCoordinate, y: yCoordinateOfCar, width: elementSize, height: elementSize  )
        
        treeImage.frame = CGRect(x: leftOriginCoordinate , y: yCoordinateOfTree, width: elementSize , height: elementSize)
        
        pitImage.frame = CGRect(x: rightOriginCoordinate, y: yCoordinateOfPit, width: elementSize, height: elementSize)
        
        roadImage.frame = CGRect(x: 0, y: topPanding, width: screenWidth, height: screenHeight - topPanding - bottomPanding)
        
        view.addSubview(roadImage)
        view.addSubview(carImage)
        view.addSubview(treeImage)
        view.addSubview(pitImage)
        
    }
    @IBAction func changeCarPosition(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0: UIView.animate(withDuration: 1) { [weak self] in
            self?.carImage.frame.origin.x = self?.leftOriginCoordinate ?? 0
            self?.pitImage.frame.origin.x = self?.leftOriginCoordinate ?? 0
            self?.treeImage.frame.origin.x = self?.rightOriginCoordinate ?? 0
        }
        case 1:UIView.animate(withDuration: 1) { [weak self] in
            self?.carImage.frame.origin.x = self?.centreOriginCoordinate ?? 0
            self?.pitImage.frame.origin.x = self?.rightOriginCoordinate ?? 0
            self?.treeImage.frame.origin.x = self?.leftOriginCoordinate ?? 0
        }
            
        case 2 :UIView.animate(withDuration: 1) { [weak self] in
            self?.carImage.frame.origin.x = self?.rightOriginCoordinate ?? 0
            self?.pitImage.frame.origin.x = self?.centreOriginCoordinate ?? 0
            self?.treeImage.frame.origin.x = self?.rightOriginCoordinate ?? 0
        }
        default : return
            
        }
        
    }
    
    @objc func swipe (sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
            
        case .left: left(image:carImage)
        case .right:right(image: carImage)
            
        default : break
            
            
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
        
        
        
    }
}
