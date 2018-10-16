# Constrainable

![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![](http://img.shields.io/badge/iOS-11.0%2B-blue.svg)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Based on [Chris Eidhof's idea](http://chris.eidhof.nl/post/micro-autolayout-dsl/) and [Marcin Siemaszko's expanded implementation](https://www.netguru.co/codestories/painless-nslayoutanchors), a programmatic autolayout µframework that supports Keypath–based declarative layout for both **views** and **layout guides**

## At a glace:

A simple layout without Constrainable:

```swift
let view = UIView()
let container = UILayoutGuide()
let firstLabel = UILabel()
let secondLabel = UILabel()
let spacer = UILayoutGuide()

view.addSubview(firstLabel)
view.addSubview(secondLabel)
view.addLayoutGuide(container)
view.addLayoutGuide(spacer)

firstLabel.translatesAutoresizingMaskIntoConstraints = false
secondLabel.translatesAutoresizingMaskIntoConstraints = false

// Container has the same edges as the view's layoutMarginsGuide
NSLayoutConstraint.activate([
    container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
    container.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
    container.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
    container.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
])

// firstLabel and secondLabel are vertically centered in the container, have the same width and are separated by a 20 points spacer
NSLayoutConstraint.activate([
    firstLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
    firstLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
    firstLabel.trailingAnchor.constraint(equalTo: spacer.leadingAnchor),

    spacer.widthAnchor.constraint(equalToConstant: 20),

    secondLabel.centerYAnchor.constraint(equalTo: firstLabel.centerYAnchor),
    secondLabel.leadingAnchor.constraint(equalTo: spacer.trailingAnchor),
    secondLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
    secondLabel.widthAnchor.constraint(equalTo: firstLabel.widthAnchor),
])
```
With Constrainable:
```swift
let view = UIView()
let container = UILayoutGuide()
let firstLabel = UILabel()
let secondLabel = UILabel()
let spacer = UILayoutGuide()

view.addSubview(firstLabel)
view.addSubview(secondLabel)
view.addLayoutGuide(container)
view.addLayoutGuide(spacer)

// Container has the same edges as the view's layoutMarginsGuide
container.activate(
    constraint(edgesTo: view.layoutMarginsGuide)
)

// firstLabel and secondLabel are vertically centered in the container, have the same width and are separated by a 20 points spacer
firstLabel.activate([
    constraint(same: \.centerYAnchor, as: container),
    constraint(same: \.leadingAnchor, as: container),
    constraint(\.trailingAnchor, to: \.leadingAnchor, of: spacer)
])

spacer.activate([
    constraint(\.widthAnchor, to: 20)
])

secondLabel.activate([
    constraint(same: \.centerYAnchor, as: firstLabel),
    constraint(same: \.trailingAnchor, as: container),
    constraint(\.leadingAnchor, to: \.trailingAnchor, of: spacer),
    constraint(same: \.widthAnchor, as: firstLabel),
])
```
## Full NSLayoutConstraint features:

You can specify the kind of relation between constrainable objects (equal, lessThanOrEqual, greaterThanOrEqual), the constant, the multiplier (even for NSLayoutAnchor), and the layout priority

```Swift
constraint(\.topAnchor, to: \.bottomAnchor, of: someView, relation: .lessThanOrEqual, offset: 10, multiplier: 0.5, priority: .defaultLow)
```

## Shorthand:

Since version 1.0 you can decide to use shorthand for KeyPaths:
```Swift
constraint(.top, to: .bottom, of: someView)
```
instead of:
```Swift
constraint(\.topAnchor, to: \.bottomAnchor, of: someView)
```

**with autocomplete!** 🎉

## Tips and tricks:

• You can constrain a dimension to a constant: 
```Swift
constraint(.width, to: 10)
constraint(.height, to: 10)
```
• If you are constraining two objects to the same anchor, you can use the "same" shorthand:
```Swift
// This:
constraint(.top, to: .top, of: someView)
constraint(.width, to: .width, of: someView)

// Is the same as this:
constraint(same: .top, as: someView)
constraint(same: .width, as: someView)
```

• You can constrain both dimension at the same time:
```Swift
// This:
constraint(same: .height, as: someView, multiplier: 2)
constraint(same: .width, as: someView, multiplier: 2)

// Is the same as this:
constraint(sizeAs: someView, multiplier: 2)
```

• You can constrain all the edges at once (with insets, even):
```Swift
// This:
constraint(same: .top, as: someView, offset: 10)
constraint(same: .bottom, as: someView, offset: -10)
constraint(same: .leading, as: someView, offset: 10)
constraint(same: .trailing, as: someView, offset: -10)

// Is the same as this:
let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
constraint(edgesTo: someView, with: padding)
```
**Note:** The last two functions return an array of constraints instead of a single one!
```Swift
// WRONG:
someOtherView.activate([
    constraint(edgesTo: someView)
])

// RIGHT:
someOtherView.activate(
    constraint(edgesTo: someView)
)
```
```Swift
// WRONG:
someOtherView.activate([
    constraint(sizeAs: someView),
    constraint(same: .centerX, as: someView),
    constraint(same: .centerY, as: someView)
])

// RIGHT:
someOtherView.activate(
    constraint(sizeAs: someView) + [
    constraint(same: .centerX, as: someView),
    constraint(same: .centerY, as: someView)
])
```
• For animations, you can store the constraint in a lazy variable:
```Swift
lazy var animatableCenterY = constraint(same: .centerY, as: someView)(someOtherView)

someOtherView.activate([
... // Other constraints
])
animatableCenterY.isActive = true

animatableCenterY.constant = 100
UIView.animate(withDuration: 0.25) {
    self.view.layoutIfNeeded()
}
```
