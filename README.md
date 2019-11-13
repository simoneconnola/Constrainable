# Constrainable

![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)
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
container.constrain(
    matchEdges(of: view.layoutMarginsGuide)
)

// firstLabel and secondLabel are vertically centered in the container, have the same width and are separated by a 20 points spacer
firstLabel.constrain(
    match(.centerY, of: container),
    match(.leading, of: container),
    pin(.trailing, to: .leading, of: spacer)
)

spacer.constrain(
    set(.width, to: 20)
)

secondLabel.constrain(
    match(.centerY, of: firstLabel),
    match(.trailing, of: container),
    pin(.leading, to: .trailing, of: spacer),
    match(.width, of: firstLabel),
)
```
## Full NSLayoutConstraint features:

You can specify the kind of relation between constrainable types (equal, lessThanOrEqual, greaterThanOrEqual), the constant, the multiplier (even for NSLayoutAnchor), and the layout priority

```Swift
pin(
    .top, 
    to: .bottom, 
    of: someView, 
    relation: .lessThanOrEqual, 
    offset: 10, 
    multiplier: 0.5, 
    priority: .defaultLow
)
```

## Tips and tricks:

• You can constrain a dimension to a constant: 
```Swift
set(.width, to: 10)
set(.height, to: 10)
```
• If you are constraining two objects to the same anchor, you can use the "same" shorthand:
```Swift
// This:
pin(.top, to: .top, of: someView)
pin(.width, to: .width, of: someView)

// Is the same as this:
match(.top, of: someView)
match(.width, of: someView)
```

• You can constrain both dimension at the same time:
```Swift
// This:
match(.height, of: someView, multiplier: 2)
match(.width, of: someView, multiplier: 2)

// Is the same as this:
matchSize(of: someView, multiplier: 2)
```

• You can set an aspect ratio easily:
```Swift
set(aspectRatio: 2) // width == height * 2
```


• You can constrain all the edges at once (with or without insets):
```Swift
// This:
match(.top, of: someView, offset: 10)
match(.bottom, of: someView, offset: -10)
match(.leading, of: someView, offset: 10)
match(.trailing, of: someView, offset: -10)

// Is the same as this:
let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
matchEdges(of: someView, insets: padding)
```
