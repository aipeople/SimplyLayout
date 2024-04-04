//
//  NSLayoutConstraintExtension.swift
//  SimplyLayout
//
//  Created by aipeople on 27/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


// ---------------
// MARK: - Setup
// ---------------

extension NSLayoutConstraint {
    
    internal func setup(withPriority priority: UILayoutPriority = SimplyLayout.config.defaultPriority, activated: Bool = SimplyLayout.config.defaultActivation) -> NSLayoutConstraint {
        
        self.priority = priority
        self.isActive = activated
        
        if let view = firstItem as? UIView {
            
            let skip: Bool
            if let superview = view.superview {
                
                if  view == (superview as? UITableViewCell)?.contentView ||
                    view == (superview as? UITableViewHeaderFooterView)?.contentView ||
                    view == (superview as? UICollectionViewCell)?.contentView {
                    skip = true
                } else {
                    skip = false
                }
            } else {
                skip = false
            }
            
            if !skip {
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        
        if  SimplyLayout.postNotificationWhenConstrantCreate {
            
            let notification = Notification(name: SimplyLayout.constraintCreatedNotification, object: self, userInfo: nil)
            NotificationQueue.default.enqueue(notification, postingStyle: .now)
        }
        
        return self
    }
}


// ---------------
// MARK: - Constants
// ---------------
/*
public extension NSLayoutConstraint {
    
    // MARK: +
    public static func + (lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        
        lhs.constant = rhs
        return lhs
    }
    
    public static func + (lhs: NSLayoutConstraint, rhs: Double) -> NSLayoutConstraint {
        
        return lhs + CGFloat(rhs)
    }
    
    public static func + (lhs: NSLayoutConstraint, rhs: Int) -> NSLayoutConstraint {
        
        return lhs + CGFloat(rhs)
    }
    
    // MARK: -
    public static func - (lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs + -rhs
    }
    
    public static func - (lhs: NSLayoutConstraint, rhs: Double) -> NSLayoutConstraint {
        
        return lhs + -rhs
    }
    
    public static func - (lhs: NSLayoutConstraint, rhs: Int) -> NSLayoutConstraint {
        
        return lhs + -rhs
    }
    
    // MARK: ×
    public static func * (lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        
        if let firstItem = lhs.firstItem {
            
            let constraint = NSLayoutConstraint(
                item: firstItem,
                attribute:  lhs.firstAttribute,
                relatedBy:  lhs.relation,
                toItem:     lhs.secondItem,
                attribute:  lhs.secondAttribute,
                multiplier: rhs,
                constant:   lhs.constant
            )
            constraint.priority = lhs.priority
            constraint.isActive = lhs.isActive
            
            if let view = lhs.ownerView {
                
                view.removeConstraint(lhs)
                view.addConstraint(constraint)
            }
            return constraint
        }
        return lhs
    }
    
    public static func * (lhs: NSLayoutConstraint, rhs: Double) -> NSLayoutConstraint {
        
        return lhs * CGFloat(rhs)
    }
    
    public static func * (lhs: NSLayoutConstraint, rhs: Int) -> NSLayoutConstraint {
        
        return lhs * CGFloat(rhs)
    }
}*/


// ---------------
// MARK: - Priority
// ---------------
/*
public extension NSLayoutConstraint {
    
    @discardableResult
    public static func ~ (lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
        
        if let firstItem = lhs.firstItem {
            
            let constraint = NSLayoutConstraint(
                item: firstItem,
                attribute:  lhs.firstAttribute,
                relatedBy:  lhs.relation,
                toItem:     lhs.secondItem,
                attribute:  lhs.secondAttribute,
                multiplier: lhs.multiplier,
                constant:   lhs.constant
            )
            constraint.priority = rhs
            constraint.isActive = lhs.isActive
            
            if let view = lhs.ownerView {
                
                view.removeConstraint(lhs)
                view.addConstraint(constraint)
            }
            return constraint
        }
        return lhs
    }
    
    @discardableResult
    public static func ~ (lhs: NSLayoutConstraint, rhs: Int) -> NSLayoutConstraint {
        
        return lhs ~ UILayoutPriority(Float(rhs))
    }
    
    @discardableResult
    public static func ~ (lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        
        return lhs ~ UILayoutPriority(Float(rhs))
    }
    
    @discardableResult
    public static func ~ (lhs: NSLayoutConstraint, rhs: Double) -> NSLayoutConstraint {
        
        return lhs ~ UILayoutPriority(Float(rhs))
    }
}


extension NSLayoutConstraint {
    
    fileprivate var ownerView: UIView? {
        
        var parentView: UIView? = firstItem as? UIView
        while true {
            if let view = parentView {
                if view.constraints.contains(self) {
                    break
                } else {
                    parentView = view.superview
                }
            } else {
                break
            }
        }
        return parentView
    }
}*/
