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


extension CGFloat {
    
    public static func ~(lhs: CGFloat, rhs: Float) -> AttributedConstant {
        
        return lhs ~ UILayoutPriority(rhs)
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

