//
//  CenterAnchor.swift
//  SimplyLayout
//
//  Created by aipeople on 05/10/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit

struct CenterAnchor {
    
    typealias CenterAnchorSet = (centerX: NSLayoutXAxisAnchor, centerY: NSLayoutYAxisAnchor)
    
    let anchorSet: CenterAnchorSet
    
}


extension CenterAnchor {
    
    @discardableResult
    public static func ==(lhs: CenterAnchor, rhs: CenterAnchor) -> [NSLayoutConstraint] {
        
        return [
            lhs.anchorSet.centerX  == rhs.anchorSet.centerX,
            lhs.anchorSet.centerY  == rhs.anchorSet.centerY
        ]
    }
    
}

extension UIView {
    
    var centerAnchor: CenterAnchor {
        return CenterAnchor(anchorSet: (centerXAnchor, centerYAnchor))
    }
    
}
