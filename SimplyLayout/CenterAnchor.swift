//
//  CenterAnchor.swift
//  SimplyLayout
//
//  Created by Sean, Su on 2019/1/1.
//  Copyright © 2019 aipeople. All rights reserved.
//

import UIKit


public struct CenterAnchor {
    
    let xAnchor:  NSLayoutXAxisAnchor
    let yAnchor:  NSLayoutYAxisAnchor
    let constant: CGPoint
    
    fileprivate init(xAnchor: NSLayoutXAxisAnchor, yAnchor: NSLayoutYAxisAnchor, constant: CGPoint) {
        self.xAnchor  = xAnchor
        self.yAnchor  = yAnchor
        self.constant = constant
    }
}


extension CenterAnchor {
    
    @discardableResult
    public static func ==(lhs: CenterAnchor, rhs: CenterAnchor) -> [NSLayoutConstraint] {
        
        return [
            lhs.xAnchor == rhs.xAnchor + (rhs.constant.x - lhs.constant.x),
            lhs.yAnchor == rhs.yAnchor + (rhs.constant.y - lhs.constant.y)
        ]
    }
    
    @discardableResult
    public static func +(lhs: CenterAnchor, constant: CGPoint) -> CenterAnchor {
        return CenterAnchor(
            xAnchor: lhs.xAnchor,
            yAnchor: lhs.yAnchor,
            constant: CGPoint(
                x: lhs.constant.x + constant.x,
                y: lhs.constant.y + constant.y
            ))
    }
}


extension UIView {
    
    public var centerAnchor: CenterAnchor {
        return CenterAnchor(xAnchor: centerXAnchor, yAnchor: centerYAnchor, constant: .zero)
    }
}


@available(iOS 9.0, *)
extension UILayoutGuide {
    
    public var centerAnchor: CenterAnchor {
        return CenterAnchor(xAnchor: centerXAnchor, yAnchor: centerYAnchor, constant: .zero)
    }
}
