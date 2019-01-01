//
//  SimplyLayout.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import Foundation


precedencegroup SimplyLayoutPriorityPrecedenceGroup {
    higherThan: ComparisonPrecedence
    lowerThan: NilCoalescingPrecedence
}

public protocol SimplyLayoutDelegate: AnyObject {
    
    func simplyLayoutDidCreateConstraint(_ constraint: NSLayoutConstraint)
}

public class SimplyLayout {
    
    public static let config = SimplyLayoutConfiguration()
    public static weak var delegate: SimplyLayoutDelegate?
}


public class SimplyLayoutConfiguration {
    
    public var defaultPriority: UILayoutPriority = .required
    public var defaultActivation: Bool = true
}
