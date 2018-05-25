
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
    var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
    var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {

    public var firstBaselineAnchor: NSLayoutYAxisAnchor {
        return topAnchor
    }
    public var lastBaselineAnchor: NSLayoutYAxisAnchor {
        return bottomAnchor
    }
}

public extension Constrainable {

    @discardableResult func activate(_ constraintDescriptions: [Constraint]) -> [NSLayoutConstraint] {
        let constraints = bind(constraintDescriptions)
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult func activate(_ constraintDescription: Constraint) -> NSLayoutConstraint {
        let constraint = bind(constraintDescription)
        NSLayoutConstraint.activate([constraint])
        return constraint
    }

    @discardableResult func bind(_ constraintDescriptions: [Constraint]) -> [NSLayoutConstraint] {
        if let view = self as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraints = constraintDescriptions.map { $0(self) }
        return constraints
    }

    @discardableResult func bind(_ constraintDescription: Constraint) -> NSLayoutConstraint {
        if let view = self as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = constraintDescription(self)
        return constraint
    }
}

public typealias Constraint = (_ constrainable: Constrainable) -> NSLayoutConstraint

public enum ConstraintsRelation {
    case equal, lessThanOrEqual, greaterThanOrEqual
}

public func constraint<Anchor, Axis>(_ originKeyPath: KeyPath<Constrainable, Anchor>, to destinationKeyPath: KeyPath<Constrainable, Anchor>, of destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { constrainable in
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        case .lessThanOrEqual:
            constraint =  constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        case .greaterThanOrEqual:
            constraint =  constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).withMultiplier(multiplier)
        }
        constraint.priority = priority
        constraint.identifier = identifier
        return constraint
    }
}

public func constraint<Anchor, Axis>(same keyPath: KeyPath<Constrainable, Anchor>, as destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return constraint(keyPath, to: keyPath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint<LayoutDimension>(_ originKeyPath: KeyPath<Constrainable, LayoutDimension>, to destinationKeyPath: KeyPath<Constrainable, LayoutDimension>, of destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .lessThanOrEqual:
            constraint = constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .greaterThanOrEqual:
            constraint = constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        }
        constraint.identifier = identifier
        constraint.priority = priority
        return constraint
    }
}

public func constraint<LayoutDimension>(same keyPath: KeyPath<Constrainable, LayoutDimension>, as destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint where LayoutDimension: NSLayoutDimension {
    return constraint(keyPath, to: keyPath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint<LayoutDimension>(_ keyPath: KeyPath<Constrainable, LayoutDimension>, to constant: CGFloat, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        let constraint = constrainable[keyPath: keyPath].constraint(equalToConstant: (constant * multiplier))
        constraint.identifier = identifier
        constraint.priority = priority
        return constraint
    }
}

public func constraint(sizeAs destination: Constrainable, relation: ConstraintsRelation = .equal, multiplier: CGFloat = 1) -> [Constraint] {

    let width: Constraint = { constrainable in
        constraint(same: \.widthAnchor, as: destination, relation: relation, multiplier: multiplier)(constrainable)
    }

    let height: Constraint = { constrainable in
        constraint(same: \.heightAnchor, as: destination, relation: relation, multiplier: multiplier)(constrainable)
    }

    return [width, height]
}

public func constraint(sizeTo constant: CGSize, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> [Constraint] {

    let width: Constraint = { constrainable in
        constraint(\.widthAnchor, to: constant.width, multiplier: multiplier, priority: priority)(constrainable)
    }

    let height: Constraint = { constrainable in
        constraint(\.heightAnchor, to: constant.height, multiplier: multiplier, priority: priority)(constrainable)
    }

    return [width, height]
}

public func constraint(edgesTo destination: Constrainable, with insets: UIEdgeInsets = .zero) -> [Constraint] {

    let top: Constraint = { constrainable  in
        constraint(same: \.topAnchor, as: destination, offset: insets.top)(constrainable)
    }
    let bottom: Constraint = { constrainable in
        constraint(same: \.bottomAnchor, as: destination, offset: -insets.bottom)(constrainable)
    }
    let leading: Constraint = { constrainable in
        constraint(same: \.leadingAnchor, as: destination, offset: insets.left)(constrainable)
    }
    let trailing: Constraint = { constrainable in
        constraint(same: \.trailingAnchor, as: destination, offset: -insets.right)(constrainable)
    }

    return [top, bottom, leading, trailing]
}
