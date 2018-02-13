
import UIKit

public protocol Constrainable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}

public extension Constrainable {

    @discardableResult func activate(_ constraintDescriptions: [Constraint]) -> [NSLayoutConstraint] {
        if let view = self as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraints = constraintDescriptions.map { $0(self) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}

public typealias Constraint = (_ constrainable: Constrainable) -> NSLayoutConstraint

public enum ConstraintRelationship {
    case equal, lessThanOrEqual, greaterThanOrEqual
}

public func constraint<Anchor, Axis>(_ originKeyPath: KeyPath<Constrainable, Anchor>, to destinationKeyPath: KeyPath<Constrainable, Anchor>, of destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { constrainable in
        let constraint: NSLayoutConstraint
        switch relationship {
        case .equal:
            constraint = constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        case .lessThanOrEqual:
            constraint =  constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        case .greaterThanOrEqual:
            constraint =  constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        }
        constraint.priority = priority
        return constraint
    }
}

public func constraint<Anchor, Axis>(same keyPath: KeyPath<Constrainable, Anchor>, as destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return constraint(keyPath, to: keyPath, of: destination, relationship: relationship, offset: offset, multiplier: multiplier, priority: priority)
}

public func constraint<LayoutDimension>(_ originKeyPath: KeyPath<Constrainable, LayoutDimension>, to destinationKeyPath: KeyPath<Constrainable, LayoutDimension>, of destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        let constraint: NSLayoutConstraint
        switch relationship {
        case .equal:
            constraint = constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .lessThanOrEqual:
            constraint = constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .greaterThanOrEqual:
            constraint = constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        }
        constraint.priority = priority
        return constraint
    }
}

public func constraint<LayoutDimension>(same keyPath: KeyPath<Constrainable, LayoutDimension>, as destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> Constraint where LayoutDimension: NSLayoutDimension {
    return constraint(keyPath, to: keyPath, of: destination, relationship: relationship, offset: offset, multiplier: multiplier, priority: priority)
}

public func constraint<LayoutDimension>(_ keyPath: KeyPath<Constrainable, LayoutDimension>, to constant: CGFloat) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        return constrainable[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

public func constraint(edgesTo destination: Constrainable, with insets: UIEdgeInsets = .zero) -> [Constraint] {

    let top: Constraint = { constrainable  in
        return constrainable.topAnchor.constraint(equalTo: destination.topAnchor, constant: insets.top)
    }
    let bottom: Constraint = { constrainable in
        return constrainable.bottomAnchor.constraint(equalTo: destination.bottomAnchor, constant: -insets.bottom)
    }
    let leading: Constraint = { constrainable in
        return constrainable.leadingAnchor.constraint(equalTo: destination.leadingAnchor, constant: insets.left)
    }
    let trailing: Constraint = { constrainable in
        return constrainable.trailingAnchor.constraint(equalTo: destination.trailingAnchor, constant: -insets.right)
    }

    return [top, bottom, leading, trailing]
}
