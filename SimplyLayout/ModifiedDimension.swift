//
//  ModifiedDimension.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public struct ModifiedDimension {
    
    public let dimension:  NSLayoutDimension
    public var priority:   UILayoutPriority
    public var multiplier: CGFloat
    public var constant:   CGFloat
    public var shouldActivate: Bool
    
    init(dimension:  NSLayoutDimension,
         multiplier: CGFloat,
         constant:   CGFloat,
         priority:   UILayoutPriority = SimplyLayout.config.defaultPriority,
         shouldActivate: Bool = SimplyLayout.config.defaultActivation) {
        
        self.dimension  = dimension
        self.multiplier = multiplier
        self.constant   = constant
        self.priority   = priority
        self.shouldActivate = shouldActivate
    }
}


extension ModifiedDimension {
    
    public static func +(lhs: ModifiedDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: ModifiedDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: ModifiedDimension, rhs: CGFloat) -> ModifiedDimension {
        
        var dimension = lhs
        dimension.constant += rhs
        return dimension
    }
    
    public static func -(lhs: ModifiedDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs - CGFloat(rhs)
    }
    
    public static func -(lhs: ModifiedDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs - CGFloat(rhs)
    }
    
    public static func -(lhs: ModifiedDimension, rhs: CGFloat) -> ModifiedDimension {
        
        return lhs + -rhs
    }
}


extension ModifiedDimension {

    public static func *(lhs: ModifiedDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs * CGFloat(rhs)
    }
    
    public static func *(lhs: ModifiedDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs * CGFloat(rhs)
    }
    
    public static func *(lhs: ModifiedDimension, rhs: CGFloat) -> ModifiedDimension {
        
        var dimension = lhs
        dimension.multiplier *= rhs
        return dimension
    }
}


extension ModifiedDimension {
    
    public static func ~(lhs: ModifiedDimension, rhs: Int) -> ModifiedDimension {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedDimension, rhs: Double) -> ModifiedDimension {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedDimension, rhs: CGFloat) -> ModifiedDimension {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedDimension, rhs: Float) -> ModifiedDimension {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: ModifiedDimension, rhs: UILayoutPriority) -> ModifiedDimension {
        
        var dimension = lhs
        dimension.priority = rhs
        return dimension
    }
}

extension ModifiedDimension {
    
    public static prefix func --(lhs: ModifiedDimension) -> ModifiedDimension {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: ModifiedDimension) -> ModifiedDimension {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}









