//
//  ViewController.swift
//  SimplyLayoutDemo
//
//  Created by aipeople on 15/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit
import SimplyLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let boxA = UIView()
        let boxB = UIView()
        view.addSubview(boxA)
        view.addSubview(boxB)
        
        boxA.backgroundColor = .red
        boxB.backgroundColor = .orange
        
        
        view.edgeAnchor == view.superview!.edgeAnchor + UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        let verticalConstraintGroup = NSLayoutConstraint.group {
            
            boxA.centerXAnchor == boxA.superview!.centerXAnchor
            boxB.centerXAnchor == boxB.superview!.centerXAnchor
            
            boxA.heightAnchor  == boxB.heightAnchor
            boxA.widthAnchor   == 40
            boxB.widthAnchor   == 40
            
            boxA.topAnchor     == boxA.superview!.topAnchor + 10
            boxB.topAnchor     == boxA.bottomAnchor + 10
            boxB.bottomAnchor  == boxB.superview!.bottomAnchor - 10
        }
        
        let horizontalConstraintGroup = NSLayoutConstraint.group(activated: false) {
            
            boxA.centerYAnchor == boxA.superview!.centerYAnchor
            boxB.centerYAnchor == boxB.superview!.centerYAnchor
            
            boxA.widthAnchor   == boxB.widthAnchor
            boxA.heightAnchor  == 40
            boxB.heightAnchor  == 40
            
            boxA.leftAnchor    == boxA.superview!.leftAnchor + 10
            boxB.leftAnchor    == boxA.rightAnchor + 10
            boxB.rightAnchor   == boxB.superview!.rightAnchor - 10
        }
        
        
        let box = UIView()
        box.backgroundColor = .lightGray
        view.addSubview(box)
        
        // Setup globally configs
        // Basically, configs should be set in `didFinishLaunchingWithOptions:`
        //SimplyLayout.config.defaultActivation = true // Default value is `true`
        //SimplyLayout.config.defaultPriority   = .required // Default value is `.required`
        
        // Setup a constraint with constant by using `+` or `-`
        box.widthAnchor == 100 // The constant can be Int, Double, CGFloat
        
        // Setup a constraint with mutiplier by using `*`
        box.heightAnchor == box.superview!.heightAnchor * 0.25 + 40
        
        // Setup a constraint with priority by using `~`
        box.heightAnchor == box.superview!.heightAnchor * 0.25 ~ 750
        
        // Setup a constraint with activate or inactivate state by using `--` or `++`
        box.centerXAnchor == box.superview!.centerXAnchor ~ 750 // The constraint will be activated based on the value of `defaultActivation` in configs.
        box.centerXAnchor == --box.superview!.centerXAnchor + 100 // This will force the constraint stays in inactive mode after created.
        
        // Store the created constraint
        let centerYConstraint = box.centerYAnchor == box.superview!.centerYAnchor
        
        // Modify the stored constraint
        DispatchQueue.global().async {
            sleep(3)
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: 0.5, animations: {
                    centerYConstraint.constant = 100
                    verticalConstraintGroup.deactivateAll()
                    horizontalConstraintGroup.activateAll()
                    self.view.layoutIfNeeded()
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

