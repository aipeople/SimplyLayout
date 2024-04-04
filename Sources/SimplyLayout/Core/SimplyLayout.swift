//
//  SimplyLayout.swift
//  SimplyLayout
//
//  Created by aipeople on 28/09/2017.
//  Copyright © 2017 aipeople. All rights reserved.
//

import UIKit


precedencegroup SimplyLayoutPriorityPrecedenceGroup {
    higherThan: ComparisonPrecedence
    lowerThan: NilCoalescingPrecedence
}

public class SimplyLayout {
    
    public static let config = SimplyLayoutConfiguration()
    public static var postNotificationWhenConstrantCreate: Bool = false
    public static let constraintCreatedNotification = Notification.Name(rawValue: "SimplyLayout.constraintCreatedNotification")
}


public class SimplyLayoutConfiguration {
    
    public var defaultPriority: UILayoutPriority = .required
    public var defaultActivation: Bool = true
}
