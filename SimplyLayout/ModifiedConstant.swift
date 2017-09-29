//
//  ModifiedConstant.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public struct ModifiedConstant {
    
    public var constant: CGFloat
    public var priority: UILayoutPriority
    public var shouldActivate: Bool
    
    init(constant: CGFloat,
         priority: UILayoutPriority = SimplyLayout.config.defaultPriority,
         shouldActivate: Bool = SimplyLayout.config.defaultActivation) {
        
        self.constant = constant
        self.priority = priority
        self.shouldActivate = shouldActivate
    }
}


extension Int {
    
    public static func ~(lhs: Int, rhs: Int) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: Double) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: CGFloat) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: Float) -> ModifiedConstant {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: Int, rhs: UILayoutPriority) -> ModifiedConstant {
        
        return ModifiedConstant(constant: CGFloat(lhs), priority: rhs)
    }
    
    public static prefix func --(lhs: Int) -> ModifiedConstant {
        
        return --(CGFloat(lhs))
    }
    
    public static prefix func ++(lhs: Int) -> ModifiedConstant {
        
        return ++(CGFloat(lhs))
    }
}

extension Double {
    
    public static func ~(lhs: Double, rhs: Int) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: Double) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: CGFloat) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: Float) -> ModifiedConstant {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: Double, rhs: UILayoutPriority) -> ModifiedConstant {
        
        return ModifiedConstant(constant: CGFloat(lhs), priority: rhs)
    }
    
    public static prefix func --(lhs: Double) -> ModifiedConstant {
        
        return --(CGFloat(lhs))
    }
    
    public static prefix func ++(lhs: Double) -> ModifiedConstant {
        
        return ++(CGFloat(lhs))
    }
}

extension CGFloat {
    
    public static func ~(lhs: CGFloat, rhs: Int) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: Double) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: CGFloat) -> ModifiedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: Float) -> ModifiedConstant {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: UILayoutPriority) -> ModifiedConstant {
        
        return ModifiedConstant(constant: lhs, priority: rhs)
    }
    
    public static prefix func --(lhs: CGFloat) -> ModifiedConstant {
        
        return ModifiedConstant(constant: lhs, shouldActivate: false)
    }
    
    public static prefix func ++(lhs: CGFloat) -> ModifiedConstant {
        
        return ModifiedConstant(constant: lhs, shouldActivate: true)
    }
}

extension ModifiedConstant {
    
    public static prefix func --(lhs: ModifiedConstant) -> ModifiedConstant {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: ModifiedConstant) -> ModifiedConstant {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}

