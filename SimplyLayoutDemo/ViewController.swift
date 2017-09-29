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
        
        let view1 = UIView()
        let view2 = UIView()
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        view1.widthAnchor   == view.widthAnchor * 0.5 + 50 ~ 750
        view1.heightAnchor  == 150
        view1.leadingAnchor == view.leadingAnchor + 50  ~ 750
        view1.leadingAnchor == --view.leadingAnchor + 150 ~ 800
        view1.bottomAnchor  == view.bottomAnchor  - 100
        view1.backgroundColor = .red
        
        print("----- \(view1.constraints)")
        print("----- \(view.constraints)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

