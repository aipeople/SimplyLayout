//
//  AttributedAnchor.swift
//  SimplyLayout
//
//  Created by aipeople on 27/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


public struct AttributedAnchor<AnchorType> where AnchorType: AnyObject {
    
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

extension AttributedAnchor {
    
    public static func +(lhs: AttributedAnchor, rhs: CGFloat) -> AttributedAnchor {
        
        var anchor = lhs
        anchor.constant += rhs
        return anchor
    }

    public static func -(lhs: AttributedAnchor, rhs: CGFloat) -> AttributedAnchor {
        
        return lhs + -rhs
    }
}


infix operator ~: SimplyLayoutPriorityPrecedenceGroup

extension AttributedAnchor {
    
    public static func ~(lhs: AttributedAnchor, rhs: Float) -> AttributedAnchor {
        
        return lhs ~ UILayoutPriority(rawValue: rhs)
    }
    
    public static func ~(lhs: AttributedAnchor, rhs: UILayoutPriority) -> AttributedAnchor {
        
        var anchor = lhs
        anchor.priority = rhs
        return anchor
    }
}


prefix operator ++
prefix operator --

extension AttributedAnchor {
    
    public static prefix func --(lhs: AttributedAnchor) -> AttributedAnchor {
        
        guard lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = false
        return anchor
    }
    
    public static prefix func ++(lhs: AttributedAnchor) -> AttributedAnchor {
        
        guard !lhs.shouldActivate else {
            return lhs
        }
        
        var anchor = lhs
        anchor.shouldActivate = true
        return anchor
    }
}









