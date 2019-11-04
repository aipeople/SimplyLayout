//
//  AttributedDimension.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public struct AttributedDimension {
    
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


extension AttributedDimension {
    
    public static func +(lhs: AttributedDimension, rhs: CGFloat) -> AttributedDimension {
        
        var dimension = lhs
        dimension.constant += rhs
        return dimension
    }
    
    public static func -(lhs: AttributedDimension, rhs: CGFloat) -> AttributedDimension {
        
        return lhs + -rhs
    }
}


extension AttributedDimension {
    
    public static func *(lhs: AttributedDimension, rhs: CGFloat) -> AttributedDimension {
        
        var dimension = lhs
        dimension.multiplier *= rhs
        return dimension
    }
}


extension AttributedDimension {
    
    public static func ~(lhs: AttributedDimension, rhs: Float) -> AttributedDimension {
        
        return lhs ~ UILayoutPriority(rhs)
    }
    
    public static func ~(lhs: AttributedDimension, rhs: UILayoutPriority) -> AttributedDimension {
        
        var dimension = lhs
        dimension.priority = rhs
        return dimension
    }
}

extension AttributedDimension {
    
    public static prefix func --(lhs: AttributedDimension) -> AttributedDimension {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: AttributedDimension) -> AttributedDimension {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}









