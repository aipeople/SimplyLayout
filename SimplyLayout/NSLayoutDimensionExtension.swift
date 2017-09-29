//
//  NSLayoutDimensionExtension.swift
//  SimplyLayout
//
//  Created by aipeople on 27/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public extension NSLayoutDimension {
    
    // MARK: To anchor
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup(withPriority: .required)
    }
    
    // MARK: To mudified dimension
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: ModifiedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: ModifiedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: ModifiedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    // MARK: To mudified constant
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: ModifiedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: ModifiedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: ModifiedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    // MARK: To number
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: Int) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: Double) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: Int) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: Double) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: rhs).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: Int) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: Double) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: CGFloat(rhs)).setup(withPriority: .required)
    }
    
    // MARK: Constant
    public static func +(lhs: NSLayoutDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: NSLayoutDimension, rhs: CGFloat) -> ModifiedDimension {
        
        return ModifiedDimension(dimension: lhs, multiplier: 1, constant: rhs)
    }
    
    public static func -(lhs: NSLayoutDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs + -CGFloat(rhs)
    }
    
    public static func -(lhs: NSLayoutDimension, rhs: CGFloat) -> ModifiedDimension {
        
        return lhs + -rhs
    }
    
    // MARK: Multiplier
    public static func *(lhs: NSLayoutDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs * CGFloat(rhs)
    }
    
    public static func *(lhs: NSLayoutDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs * CGFloat(rhs)
    }
    
    public static func *(lhs: NSLayoutDimension, rhs: CGFloat) -> ModifiedDimension {
        
        return ModifiedDimension(dimension: lhs, multiplier: rhs, constant: 0)
    }
}

extension NSLayoutDimension {
    
    public static prefix func --(lhs: NSLayoutDimension) -> ModifiedDimension {
        
        return ModifiedDimension(dimension: lhs, multiplier: 1, constant: 0)
    }
    
    public static prefix func ++(lhs: NSLayoutDimension) -> ModifiedDimension {
        
        return ModifiedDimension(dimension: lhs, multiplier: 1, constant: 0)
    }
}
