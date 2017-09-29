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

public class SimplyLayout {
    
    public static let config = SimplyLayoutConfiguration()
}


public class SimplyLayoutConfiguration {
    
    public var defaultPriority: UILayoutPriority = UILayoutPriorityRequired
    public var defaultActivation: Bool = true
}
