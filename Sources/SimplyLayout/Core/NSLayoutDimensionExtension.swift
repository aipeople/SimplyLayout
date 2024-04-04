//
//  NSLayoutDimensionExtension.swift
//  SimplyLayout
//
//  Created by aipeople on 27/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


extension NSLayoutDimension {
    
    // MARK: To anchor
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs).setup()
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs).setup()
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs).setup()
    }
    
    // MARK: To mudified dimension
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: AttributedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(equalTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: AttributedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: AttributedDimension) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualTo: rhs.dimension, multiplier: rhs.multiplier, constant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    // MARK: To mudified constant
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: AttributedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: AttributedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: AttributedConstant) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: rhs.constant).setup(withPriority: rhs.priority, activated: rhs.shouldActivate)
    }
    
    // MARK: To number
    @discardableResult
    public static func ==(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(equalToConstant: rhs).setup()
    }
    
    @discardableResult
    public static func <=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(lessThanOrEqualToConstant: rhs).setup()
    }
    
    @discardableResult
    public static func >=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs.constraint(greaterThanOrEqualToConstant: rhs).setup()
    }
    
    // MARK: Constant
    
    public static func +(lhs: NSLayoutDimension, rhs: CGFloat) -> AttributedDimension {
        
        return AttributedDimension(dimension: lhs, multiplier: 1, constant: rhs)
    }
    
    public static func -(lhs: NSLayoutDimension, rhs: CGFloat) -> AttributedDimension {
        
        return lhs + -rhs
    }
    
    // MARK: Multiplier
    
    public static func *(lhs: NSLayoutDimension, rhs: CGFloat) -> AttributedDimension {
        
        return AttributedDimension(dimension: lhs, multiplier: rhs, constant: 0)
    }
}


extension NSLayoutDimension {
    
    public static func ~(lhs: NSLayoutDimension, rhs: Float) -> AttributedDimension {
        
        return lhs ~ UILayoutPriority(rhs)
    }
    
    public static func ~(lhs: NSLayoutDimension, rhs: UILayoutPriority) -> AttributedDimension {
        
        return AttributedDimension(dimension: lhs, multiplier: 1, constant: 0, priority: rhs)
    }
}

extension NSLayoutDimension {
    
    public static prefix func --(lhs: NSLayoutDimension) -> AttributedDimension {
        
        return AttributedDimension(dimension: lhs, multiplier: 1, constant: 0)
    }
    
    public static prefix func ++(lhs: NSLayoutDimension) -> AttributedDimension {
        
        return AttributedDimension(dimension: lhs, multiplier: 1, constant: 0)
    }
}
