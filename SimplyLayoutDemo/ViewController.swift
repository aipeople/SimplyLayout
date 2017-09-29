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
        
        let testView = UIView()
        
        view.addSubview(testView)
        
        testView.widthAnchor   == view.widthAnchor * 0.5 + 50 ~ 750
        testView.heightAnchor  == 150
        testView.leadingAnchor == view.leadingAnchor + 50  ~ 750
        testView.bottomAnchor  == view.bottomAnchor  - 100
        testView.backgroundColor = .red
        
        let constraint =
        testView.leadingAnchor == --view.leadingAnchor + 150 ~ 800
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                constraint.isActive = true
            }
        }
        
        print("----- \(testView.constraints)")
        print("----- \(view.constraints)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

