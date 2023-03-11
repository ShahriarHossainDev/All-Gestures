//
//  TapViewController.swift
//  All Gestures
//
//  Created by Shishir_Mac on 11/3/23.
//

import UIKit

class TapViewController: UIViewController {
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var longPressedView: UIView!
    @IBOutlet weak var rotationView: UIView!
    @IBOutlet weak var pinchVIew: UIView!
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapView.layer.cornerRadius = 10
        tapView.dropShadow()
        
        longPressedView.layer.cornerRadius = 10
        longPressedView.dropShadow()
        
        rotationView.layer.cornerRadius = 10
        rotationView.dropShadow()
        
        swipeView.layer.cornerRadius = 10
        swipeView.dropShadow()
        
        pinchVIew.layer.cornerRadius = 10
        pinchVIew.dropShadow()
        
        panView.layer.cornerRadius = 10
        panView.dropShadow()
        
        tapGestures()
        longPressedGestures()
        rotationGestures()
        pinchGestures()
        panGestures()
        swipeGestures()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Tap Gestures
    
    func tapGestures(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        self.tapView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        print("Tap Gesture")
    }
    
    // MARK: - Long Pressed Gestures
    
    func longPressedGestures(){
        let longPressed:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressed(_:)))
        longPressed.minimumPressDuration = 0.5
        self.longPressedView.addGestureRecognizer(longPressed)
    }
    
    @objc func handleLongPressed(_ sender: UILongPressGestureRecognizer? = nil) {
        print("Long Pressed Gestures")
        
    }
    
    
    // MARK: - Rotation Gesture
    
    func rotationGestures(){
        let rotation:UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotation(_:)))
        self.rotationView.addGestureRecognizer(rotation)
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer? = nil) {
        print("Rotation Gesture")
        
        sender?.view?.transform = (sender?.view!.transform.rotated(by: sender!.rotation))!
        sender!.rotation = 0
        
    }
    
    // MARK: - Pinch Gesture
    func pinchGestures(){
        
        let pinch:UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        self.pinchVIew.addGestureRecognizer(pinch)
    }
    
    
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer? = nil) {
        
        print("Pinch Gesture")
        
        sender?.view!.transform = (sender?.view?.transform.scaledBy(x: sender!.scale, y: sender!.scale))!
        sender?.scale = 1.0
    }
    
    //MARK: - Pan Gesture
    func panGestures(){
        
        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        self.panView.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer? = nil) {
        
        print("Pan Gesture")
        
        let translation = sender?.translation(in: self.view)
        sender?.view!.center = CGPoint(x: (sender?.view!.center.x)! + translation!.x, y: (sender?.view!.center.y)! + translation!.y)
        sender?.setTranslation(CGPoint.zero, in: self.view)
    }
    
    // MARK: - Swipe Gesture
    func swipeGestures() {
        let leftside = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        leftside.direction = .left
        swipeView.addGestureRecognizer(leftside)
        
        let rightside = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        rightside.direction = .right
        swipeView.addGestureRecognizer(rightside)
        
        
        let upside =  UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        upside.direction = .up
        swipeView.addGestureRecognizer(upside)
        
        let downside = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        downside.direction = .down
        swipeView.addGestureRecognizer(downside)
    }
    
    @objc func swiped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                swipeView.backgroundColor = UIColor.red
            case UISwipeGestureRecognizer.Direction.right:
                swipeView.backgroundColor = UIColor.yellow
            case UISwipeGestureRecognizer.Direction.up:
                swipeView.backgroundColor = UIColor.green
            case UISwipeGestureRecognizer.Direction.down:
                swipeView.backgroundColor = UIColor.blue
                
            default:
                print("ERROR")
                
            }
        }
    }
}
