//
//  EdgeAnchor.swift
//  SimplyLayout
//
//  Created by Sean, Su on 2019/1/1.
//  Copyright © 2019 aipeople. All rights reserved.
//

import UIKit


public struct EdgeAnchor {
    
    let topAnchor:      NSLayoutYAxisAnchor
    let bottomAnchor:   NSLayoutYAxisAnchor
    let leadingAnchor:  NSLayoutXAxisAnchor
    let trailingAnchor: NSLayoutXAxisAnchor
    let insets: UIEdgeInsets
    
    public init(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, insets: UIEdgeInsets) {
        
        self.topAnchor      = top
        self.leadingAnchor  = leading
        self.bottomAnchor   = bottom
        self.trailingAnchor = trailing
        self.insets         = insets
    }
    
    public func insetBy(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeAnchor {
        
        return EdgeAnchor(
            top:      topAnchor,
            leading:  leadingAnchor,
            bottom:   bottomAnchor,
            trailing: trailingAnchor,
            insets: UIEdgeInsets(
                top:    insets.top    + top,
                left:   insets.left   + left,
                bottom: insets.bottom + bottom,
                right:  insets.right  + right
        ))
    }
    
    public func insetBy(_ insets: UIEdgeInsets) -> EdgeAnchor {
    
        return insetBy(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }
}


extension EdgeAnchor {
    
    @discardableResult
    public static func ==(lhs: EdgeAnchor, rhs: EdgeAnchor) -> [NSLayoutConstraint] {
        
        return [
            lhs.topAnchor      == rhs.topAnchor      + (rhs.insets.top    - lhs.insets.top),
            lhs.leadingAnchor  == rhs.leadingAnchor  + (rhs.insets.left   - lhs.insets.left),
            lhs.bottomAnchor   == rhs.bottomAnchor   - (rhs.insets.bottom - lhs.insets.bottom),
            lhs.trailingAnchor == rhs.trailingAnchor - (rhs.insets.right  - lhs.insets.right),
        ]
    }
    
    @discardableResult
    public static func <=(lhs: EdgeAnchor, rhs: EdgeAnchor) -> [NSLayoutConstraint] {
        
        return [
            lhs.topAnchor      >= rhs.topAnchor      + (rhs.insets.top    - lhs.insets.top),
            lhs.leadingAnchor  >= rhs.leadingAnchor  + (rhs.insets.left   - lhs.insets.left),
            lhs.bottomAnchor   <= rhs.bottomAnchor   - (rhs.insets.bottom - lhs.insets.bottom),
            lhs.trailingAnchor <= rhs.trailingAnchor - (rhs.insets.right  - lhs.insets.right),
        ]
    }
    
    @discardableResult
    public static func >=(lhs: EdgeAnchor, rhs: EdgeAnchor) -> [NSLayoutConstraint] {
        
        return [
            lhs.topAnchor      <= rhs.topAnchor      + (rhs.insets.top    - lhs.insets.top),
            lhs.leadingAnchor  <= rhs.leadingAnchor  + (rhs.insets.left   - lhs.insets.left),
            lhs.bottomAnchor   >= rhs.bottomAnchor   - (rhs.insets.bottom - lhs.insets.bottom),
            lhs.trailingAnchor >= rhs.trailingAnchor - (rhs.insets.right  - lhs.insets.right),
        ]
    }
    
    @discardableResult
    public static func +(lhs: EdgeAnchor, rhs: UIEdgeInsets) -> EdgeAnchor {
        
        return lhs.insetBy(rhs)
    }
}


extension UIView {
    
    public var edgeAnchor: EdgeAnchor {
        return EdgeAnchor(
            top:      topAnchor,
            leading:  leadingAnchor,
            bottom:   bottomAnchor,
            trailing: trailingAnchor,
            insets:  .zero
        )
    }
    
    @available(iOS 11.0, *)
    public var safeAreaEdgeAnchor: EdgeAnchor {
        return EdgeAnchor(
            top:      safeAreaLayoutGuide.topAnchor,
            leading:  safeAreaLayoutGuide.leadingAnchor,
            bottom:   safeAreaLayoutGuide.bottomAnchor,
            trailing: safeAreaLayoutGuide.trailingAnchor,
            insets:  .zero
        )
    }
}


@available(iOS 9.0, *)
extension UILayoutGuide {
    
    public var edgeAnchor: EdgeAnchor {
        return EdgeAnchor(
            top:      topAnchor,
            leading:  leadingAnchor,
            bottom:   bottomAnchor,
            trailing: trailingAnchor,
            insets:  .zero
        )
    }
}
