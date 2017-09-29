//
//  AttributedConstant.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public struct AttributedConstant {
    
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
    
    public static func ~(lhs: Int, rhs: Int) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: Double) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: CGFloat) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Int, rhs: UILayoutPriority) -> AttributedConstant {
        
        return AttributedConstant(constant: CGFloat(lhs), priority: rhs)
    }
    
    public static prefix func --(lhs: Int) -> AttributedConstant {
        
        return --(CGFloat(lhs))
    }
    
    public static prefix func ++(lhs: Int) -> AttributedConstant {
        
        return ++(CGFloat(lhs))
    }
}

extension Double {
    
    public static func ~(lhs: Double, rhs: Int) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: Double) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: CGFloat) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: Double, rhs: UILayoutPriority) -> AttributedConstant {
        
        return AttributedConstant(constant: CGFloat(lhs), priority: rhs)
    }
    
    public static prefix func --(lhs: Double) -> AttributedConstant {
        
        return --(CGFloat(lhs))
    }
    
    public static prefix func ++(lhs: Double) -> AttributedConstant {
        
        return ++(CGFloat(lhs))
    }
}

extension CGFloat {
    
    public static func ~(lhs: CGFloat, rhs: Int) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: Double) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: CGFloat) -> AttributedConstant {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: CGFloat, rhs: UILayoutPriority) -> AttributedConstant {
        
        return AttributedConstant(constant: lhs, priority: rhs)
    }
    
    public static prefix func --(lhs: CGFloat) -> AttributedConstant {
        
        return AttributedConstant(constant: lhs, shouldActivate: false)
    }
    
    public static prefix func ++(lhs: CGFloat) -> AttributedConstant {
        
        return AttributedConstant(constant: lhs, shouldActivate: true)
    }
}

extension AttributedConstant {
    
    public static prefix func --(lhs: AttributedConstant) -> AttributedConstant {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: AttributedConstant) -> AttributedConstant {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}

