import UIKit
import os

extension UILayoutGuide: Constrainable {

  /// Usually a layout anchor representing the baseline for the topmost line of text in the view,
  /// in UILayoutGuide is **always equivalent to its topAnchor**.
  @inlinable
  public var firstBaselineAnchor: NSLayoutYAxisAnchor {
    return topAnchor
  }

  /// Usually a layout anchor representing the baseline for the bottommost line of text in the view,
  /// in UILayoutGuide is **always equivalent to its topAnchor**.
  @inlinable
  public var lastBaselineAnchor: NSLayoutYAxisAnchor {
    return topAnchor
  }

  @inlinable
  @discardableResult public func constrain(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint] {
    let constraints = makeConstraints(factories)
    NSLayoutConstraint.activate(constraints)
    return constraints
  }

  @inlinable
  @discardableResult public func constrain(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint] {
    let constraints = makeConstraints(factories)
    NSLayoutConstraint.activate(constraints)
    return constraints
  }

  @inlinable
  public func makeConstraints(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint] {
    factories.flatMap { $0(self) }
  }

  @inlinable
  public func makeConstraints(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint] {
    factories.flatMap { $0(self) }
  }
}
