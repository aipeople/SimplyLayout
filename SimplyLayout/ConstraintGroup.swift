//
//  ConstraintGroup.swift
//  SimplyLayout
//
//  Created by Sean, Su on 2019/1/1.
//  Copyright © 2019 aipeople. All rights reserved.
//

import UIKit


class ConstraintRecorder {
    
    static let `default` = ConstraintRecorder()
    
    fileprivate var createdConstraints: NSHashTable<NSLayoutConstraint>?
    fileprivate var postConstraintCreationNotificationByDefault: Bool = false
    
    init() {
        
        NotificationCenter.default.addObserver(
            forName: SimplyLayout.constraintCreatedNotification, object: nil, queue: nil) {
                [weak self] (notification) in
            
                guard let constraint = notification.object as? NSLayoutConstraint else {
                    return
                }
                self?.createdConstraints?.add(constraint)
            }
    }
    
    func startRecording() {
        
        createdConstraints = NSHashTable<NSLayoutConstraint>(options: [.weakMemory], capacity: 1)
        postConstraintCreationNotificationByDefault = SimplyLayout.postNotificationWhenConstrantCreate
        SimplyLayout.postNotificationWhenConstrantCreate = true
    }
    
    func endRecording() {
        
        SimplyLayout.postNotificationWhenConstrantCreate = postConstraintCreationNotificationByDefault
        createdConstraints = nil
    }
}


extension Array where Element == NSLayoutConstraint {
    
    public func activateAll() {
        for constraint in self {
            constraint.isActive = true
        }
    }
    
    public func deactivateAll() {
        for constraint in self {
            constraint.isActive = false
        }
    }
}


extension NSLayoutConstraint {
    
    open class func group(activated: Bool = SimplyLayout.config.defaultActivation, _ action: () -> ()) -> [NSLayoutConstraint] {
        
        assert(Thread.isMainThread, "Constraint group must be created on main thread")
        
        let originActivation = SimplyLayout.config.defaultActivation
        
        ConstraintRecorder.default.startRecording()
        SimplyLayout.config.defaultActivation = activated
        defer {
            ConstraintRecorder.default.endRecording()
            SimplyLayout.config.defaultActivation = originActivation
        }
        
        action()
        return ConstraintRecorder.default.createdConstraints?.allObjects ?? []
    }
}
