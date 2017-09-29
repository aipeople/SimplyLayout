//
//  ModifiedAnchor.swift
//  SimplyLayout
//
//  Created by aipeople on 27/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import Foundation


public struct ModifiedAnchor<AnchorType> {
    
    public let anchor:   NSLayoutAnchor<AnchorType>
    public var priority: UILayoutPriority
    public var constant: CGFloat
    public var shouldActivate: Bool
    
    init(anchor:   NSLayoutAnchor<AnchorType>,
         constant: CGFloat,
         priority: UILayoutPriority = SimplyLayout.config.defaultPriority,
         shouldActivate: Bool = SimplyLayout.config.defaultActivation) {
        
        self.anchor   = anchor
        self.constant = constant
        self.priority = priority
        self.shouldActivate = shouldActivate
    }
}

extension ModifiedAnchor {
    
    public static func +(lhs: ModifiedAnchor, rhs: Int) -> ModifiedAnchor {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: ModifiedAnchor, rhs: Double) -> ModifiedAnchor {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func +(lhs: ModifiedAnchor, rhs: CGFloat) -> ModifiedAnchor {
        
        var anchor = lhs
        anchor.constant += rhs
        return anchor
    }
    
    public static func -(lhs: ModifiedAnchor, rhs: Int) -> ModifiedAnchor {
        
        return lhs - CGFloat(rhs)
    }
    
    public static func -(lhs: ModifiedAnchor, rhs: Double) -> ModifiedAnchor {
        
        return lhs - CGFloat(rhs)
    }
    
    public static func -(lhs: ModifiedAnchor, rhs: CGFloat) -> ModifiedAnchor {
        
        return lhs + -rhs
    }
}


infix operator ~: SimplyLayoutPriorityPrecedenceGroup

extension ModifiedAnchor {

    public static func ~(lhs: ModifiedAnchor, rhs: Int) -> ModifiedAnchor {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedAnchor, rhs: Double) -> ModifiedAnchor {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedAnchor, rhs: CGFloat) -> ModifiedAnchor {
        
        return lhs ~ Float(rhs)
    }
    
    public static func ~(lhs: ModifiedAnchor, rhs: Float) -> ModifiedAnchor {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: ModifiedAnchor, rhs: UILayoutPriority) -> ModifiedAnchor {
        
        var anchor = lhs
        anchor.priority = rhs
        return anchor
    }
}


prefix operator ++
prefix operator --

extension ModifiedAnchor {
    
    public static prefix func --(lhs: ModifiedAnchor) -> ModifiedAnchor {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: ModifiedAnchor) -> ModifiedAnchor {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}









