//
//  OperatorDifinition.swift
//  SimplyLayout
//
//  Created by aipeople on 15/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public extension NSLayoutXAxisAnchor {
    
    @discardableResult
    public static func ==(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutXAxisAnchor, rhs: ModifiedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutXAxisAnchor, rhs: ModifiedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutXAxisAnchor, rhs: ModifiedAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    public static func +(lhs: NSLayoutXAxisAnchor, rhs: Int) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutXAxisAnchor, rhs: Double) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return ModifiedAnchor(anchor: lhs, constant: rhs)
    }
    
    public static func -(lhs: NSLayoutXAxisAnchor, rhs: Int) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutXAxisAnchor, rhs: Double) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        return lhs + -rhs
    }
}

extension NSLayoutXAxisAnchor {
    
    public static prefix func --(lhs: NSLayoutXAxisAnchor) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        var anchor = ModifiedAnchor(anchor: lhs, constant: 0)
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: NSLayoutXAxisAnchor) -> ModifiedAnchor<NSLayoutXAxisAnchor> {
        
        var anchor = ModifiedAnchor(anchor: lhs, constant: 0)
        anchor.shouldActivate = true
        return anchor
    }
}


public extension NSLayoutYAxisAnchor {
    
    @discardableResult
    public static func ==(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutYAxisAnchor, rhs: ModifiedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).setup(withPriority: .required, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutYAxisAnchor, rhs: ModifiedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: .required, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutYAxisAnchor, rhs: ModifiedAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant).setup(withPriority: .required, activated: rhs.shouldActivate)
    }
    
    public static func +(lhs: NSLayoutYAxisAnchor, rhs: Int) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutYAxisAnchor, rhs: Double) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return ModifiedAnchor(anchor: lhs, constant: rhs)
    }
    
    public static func -(lhs: NSLayoutYAxisAnchor, rhs: Int) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutYAxisAnchor, rhs: Double) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return lhs + -rhs
    }
}

extension NSLayoutYAxisAnchor {
    
    public static prefix func --(lhs: NSLayoutYAxisAnchor) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return ModifiedAnchor(anchor: lhs, constant: 0, shouldActivate: false)
    }
    
    public static prefix func ++(lhs: NSLayoutYAxisAnchor) -> ModifiedAnchor<NSLayoutYAxisAnchor> {
        
        return ModifiedAnchor(anchor: lhs, constant: 0, shouldActivate: true)
    }
}









