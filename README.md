# Constrainable

![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Based on [Chris Eidhof's idea](http://chris.eidhof.nl/post/micro-autolayout-dsl/) and [Marcin Siemaszko's expanded implementation](https://www.netguru.co/codestories/painless-nslayoutanchors?utm_campaign=Revue%20newsletter&utm_medium=Swift%20Weekly%20Newsletter%20Issue%20102&utm_source=Swift%20Weekly), a programmatic autolayout µframework that supports Keypath–based declarative layout for both views and layout guides (plus some syntactic sugar)

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

// Container has the same edges as view, with 20 points padding
NSLayoutConstraint.activate([
    container.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
    container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
    container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
])

// firstLabel and secondLabel are vertically centered in the container, have the same size and are separated by a 20 points spacer
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


// Container has the same edges as view, with 20 points padding
let padding = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
container.activate(sameEdges(as: view, with: padding))


// firstLabel and secondLabel are vertically centered in the container, have the same size and are separated by a 20 points spacer
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
## Full NSLayoutConnstraint customization:

You can specify the kind of relationship between constrainable objects (equal, lessThanOrEqual, greaterThanOrEqual), offset and multiplier (even for NSLayoutAnchor!)

```Swift
public enum ConstraintRelationship {
    case equal, lessThanOrEqual, greaterThanOrEqual
}

public func constraint<Anchor, Axis>(
    _ originKeyPath: KeyPath<Constrainable, Anchor>, 
    to destinationKeyPath: KeyPath<Constrainable, Anchor>, 
    of destination: Constrainable, 
    relationship: ConstraintRelationship = .equal, 
    offset: CGFloat = 0, 
    multiplier: CGFloat = 1) -> Constraint where Anchor: NSLayoutAnchor<Axis>

public func constraint<LayoutDimension>(
    _ originKeyPath: KeyPath<Constrainable, LayoutDimension>, 
    to destinationKeyPath: KeyPath<Constrainable, LayoutDimension>, 
    of destination: Constrainable, 
    relationship: ConstraintRelationship = .equal, 
    offset: CGFloat = 0, 
    multiplier: CGFloat = 1) -> Constraint where LayoutDimension: NSLayoutDimension
```
