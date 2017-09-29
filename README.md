# SimplyLayout
A swift syntactic sugar for anchor based Auto Layout

# Setup A Constraint
### Operators
* `+`, `-` -> Set the constant
* `*` -> Set the multiplier
* `~` -> Set the priority

Example:
```` swift
view.widthAnchor == 100
// view.widthAnchor.constraint(equalToConstant: 100).isActive = true

view.heightAnchor == view.superview!.heightAnchor * 0.25 + 40 ~ 750
// let constraint = view.heightAnchor.constraint(equalTo: view.superview!.heightAnchor, multiplier: 0.25, constant: 40)
// constraint.priority = UILayoutPriority(rawValue: 750)
// constraint.isActive = true
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

# Configurations
Default behavior can be set in `SimplyLayout.config`.
* `defaultPriority`：Default value is `.required`
* `defaultActivation`：Default value is `true`
