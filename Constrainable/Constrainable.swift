
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

public func constraint<Anchor, Axis>(_ originKeyPath: KeyPath<Constrainable, Anchor>, to destinationKeyPath: KeyPath<Constrainable, Anchor>, of destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1)-> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { constrainable in
        switch relationship {
        case .equal:
            return constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], constant: offset).setMultiplier(multiplier)
        case .lessThanOrEqual:
            return constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).setMultiplier(multiplier)
        case .greaterThanOrEqual:
            return constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], constant: offset).setMultiplier(multiplier)
        }
    }
}

public func constraint<Anchor, Axis>(same keyPath: KeyPath<Constrainable, Anchor>, as destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return constraint(keyPath, to: keyPath, of: destination, relationship: relationship, offset: offset, multiplier: multiplier)
}

public func constraint<LayoutDimension>(_ originKeyPath: KeyPath<Constrainable, LayoutDimension>, to destinationKeyPath: KeyPath<Constrainable, LayoutDimension>, of destination: Constrainable, relationship: ConstraintRelationship = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        switch relationship {
        case .equal:
            return constrainable[keyPath: originKeyPath].constraint(equalTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .lessThanOrEqual:
            return constrainable[keyPath: originKeyPath].constraint(lessThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        case .greaterThanOrEqual:
            return constrainable[keyPath: originKeyPath].constraint(greaterThanOrEqualTo: destination[keyPath: destinationKeyPath], multiplier: multiplier, constant: offset)
        }
    }
}

public func constraint<LayoutDimension>(_ keyPath: KeyPath<Constrainable, LayoutDimension>, to constant: CGFloat) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { constrainable in
        return constrainable[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

public func sameEdges(as destination: Constrainable, with insets: UIEdgeInsets = .zero) -> [Constraint] {

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
