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

