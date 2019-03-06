# SimplyLayout
A swift syntactic sugar for anchor based Auto Layout

# Installation
### CocoaPod
````
# Swift 4 with full functions, including `Core`, `Anchor` and `Group`
pod 'SimplyLayout'

# Swift 4 with syntactic sugar only
pod 'SimplyLayout/Core'

# Swift 4 with convenience virtual anchors (CenterAnchor, EdgeAnchor, etc.)
pod 'SimplyLayout/Anchor'

# Swift 4 with constraint grouping functions
pod 'SimplyLayout/Group'

# Swift 3
pod 'SimplyLayout', :git => 'https://github.com/aipeople/SimplyLayout.git', :tag => 'swift3-1.0.1'
````

# Usage
### Operator
* `+`, `-` -> Set the constant
* `*` -> Set the multiplier
* `~` -> Set the priority

Example:
```` swift
import SimplyLayout

view.widthAnchor == 100
// view.widthAnchor.constraint(equalToConstant: 100).isActive = true
// view.translatesAutoresizingMaskIntoConstraints = false

view.heightAnchor == view.superview!.heightAnchor * 0.25 + 40 ~ 750
// let constraint = view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: 0.25, constant: 40)
// constraint.priority = UILayoutPriority(rawValue: 750)
// constraint.isActive = true
// view.translatesAutoresizingMaskIntoConstraints = false
````

### Activation
Constraints will be activated automatically.
You can turn this feature off by setting the `SimplyLayout.config.defaultActivation` to `false`.
For some reasons, you may want to create a constraint with different activation status. `++` and `--` can help you get rid of default configs.

Example:
```` swift
SimplyLayout.config.defaultActivation = true

view.widthAnchor == 100
// view.widthAnchor.constraint(equalToConstant: 100).isActive = true

view.widthAnchor == --100
// view.widthAnchor.constraint(equalToConstant: 100)

SimplyLayout.config.defaultActivation = false

view.heightAnchor == view.superview!.heightAnchor * 0.25
// let constraint = view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: 0.25)

view.heightAnchor == ++view.superview!.heightAnchor * 0.25
// let constraint = view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: 0.25)
// constraint.isActive = true
````

### Access the constraint
A new created constraint can be accessed easily by using the `=` operator.

Example:
```` swift
let constraint = view.heightAnchor == view.superview!.heightAnchor * 0.25
````

### Virtual Anchor
Virtual anchors **are not** real `NSLayoutAnchor`. These anchors just help you create the constraints esily.
* **`CenterAnchor`**
```` swift
view.centerAnchor == view.superview!.centerAnchor + CGPoint(x: 10, y: 10)
// view.centerXAnchor == view.superview!.centerXAnchor + 10
// view.centerYAnchor == view.superview!.centerYAnchor + 10
````
* **`EdgeAnchor`**
```` swift
view.edgeAnchor == view.superview!.edgeAnchor
// view.topAnchor      == view.superview!.topAnchor
// view.leadingAnchor  == view.superview!.leadingAnchor
// view.bottomAnchor   == view.superview!.bottomAnchor
// view.trailingAnchor == view.superview!.trailingAnchor

view.edgeAnchor == view.superview!.edgeAnchor.insetBy(top: 10, left: 20, bottom: 10, right: 20)
// view.edgeAnchor == view.superview!.edgeAnchor + UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
// -----------------------(equals to)------------------------
// view.topAnchor      == view.superview!.topAnchor      + 10
// view.leadingAnchor  == view.superview!.leadingAnchor  + 20
// view.bottomAnchor   == view.superview!.bottomAnchor   - 10
// view.trailingAnchor == view.superview!.trailingAnchor - 20
````

### Grouping
Grouping functions require `SimplyLayout/Group` submodule. It provides a convenience way to group several constraints together. A group of constraints is represented by an array of NSLayoutConstraint, which can be activated/deactivated together.

 Example:
```` swift
let boxA = UIView()
let boxB = UIView()

// `verticalConstraintGroup` is an array with NSLayoutConstraint.
// In the following case, it will contains two constraints.
let verticalConstraintGroup = NSLayoutConstraint.group {
    boxA.centerXAnchor == boxA.superview!.centerXAnchor
    boxB.centerXAnchor == boxB.superview!.centerXAnchor
}
 
// All the constraints created in the block won't be activated 
let horizontalConstraintGroup = NSLayoutConstraint.group(activated: false) {
    boxA.centerYAnchor == boxA.superview!.centerYAnchor
    boxB.centerYAnchor == boxB.superview!.centerYAnchor
}

// Deactivate all constraints in the group
verticalConstraintGroup.deactivateAll()

// Activate all constraints in the group
horizontalConstraintGroup.activateAll()
````

# Configurations
* `postNotificationWhenConstrantCreate`: A notification named `SimplyLayout.constraintCreatedNotification` will be posted immediately after a constraint has been setup by using the syntax of SimplyLayout. Default value is `false`.

Constraint related behavior can be set in `SimplyLayout.config`.
* `defaultPriority`：Default value is `.required`
* `defaultActivation`：Default value is `true`
