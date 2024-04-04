//
//  OperatorDifinition.swift
//  SimplyLayout
//
//  Created by aipeople on 15/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


extension NSLayoutXAxisAnchor {
    
    @discardableResult
    public static func ==(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup()
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup()
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup()
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutXAxisAnchor, rhs: AttributedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutXAxisAnchor, rhs: AttributedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutXAxisAnchor, rhs: AttributedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    public static func +(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: rhs)
    }
    
    
    public static func -(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + -rhs
    }
}

extension NSLayoutXAxisAnchor {
    
    public static func ~(lhs: NSLayoutXAxisAnchor, rhs: Float) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs ~ UILayoutPriority(rhs)
    }
    
    public static func ~(lhs: NSLayoutXAxisAnchor, rhs: UILayoutPriority) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: 0, priority: rhs)
    }
}

extension NSLayoutXAxisAnchor {
    
    public static prefix func --(lhs: NSLayoutXAxisAnchor) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        var anchor = AttributedAnchor(anchor: lhs, constant: 0)
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: NSLayoutXAxisAnchor) -> AttributedAnchor<NSLayoutXAxisAnchor> {
        
        var anchor = AttributedAnchor(anchor: lhs, constant: 0)
        anchor.shouldActivate = true
        return anchor
    }
}


extension NSLayoutYAxisAnchor {
    
    @discardableResult
    public static func ==(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup()
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup()
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup()
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutYAxisAnchor, rhs: AttributedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutYAxisAnchor, rhs: AttributedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutYAxisAnchor, rhs: AttributedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    public static func +(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: rhs)
    }
    
    public static func -(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + -rhs
    }
}

extension NSLayoutYAxisAnchor {
    
    public static func ~(lhs: NSLayoutYAxisAnchor, rhs: Float) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs ~ UILayoutPriority(rhs)
    }
    
    public static func ~(lhs: NSLayoutYAxisAnchor, rhs: UILayoutPriority) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: 0, priority: rhs)
    }
}

extension NSLayoutYAxisAnchor {
    
    public static prefix func --(lhs: NSLayoutYAxisAnchor) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: 0, shouldActivate: false)
    }
    
    public static prefix func ++(lhs: NSLayoutYAxisAnchor) -> AttributedAnchor<NSLayoutYAxisAnchor> {
        
        return AttributedAnchor(anchor: lhs, constant: 0, shouldActivate: true)
    }
}









