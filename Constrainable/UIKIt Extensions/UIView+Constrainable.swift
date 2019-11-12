import UIKit

extension UIView: Constrainable {

  /// Generate and activate an array of constraints for this type.
  ///
  /// Example usage:
  /// ```
  /// // someView: UIView
  /// // anotherView: UIView
  /// someView.constrain([
  ///   center(in: anotherView),
  ///   matchSize(of: anotherView.layoutMarginsGuide, multiplier: 0.5),
  /// ])
  /// ```
  /// - Parameter factories: An array of constraints factories.
  /// - Important: invoking this method sets `translatesAutoresizingMaskIntoConstraints` to false!
  @inlinable
  @discardableResult
  public func constrain(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint] {
    let constraints = makeConstraints(factories)
    NSLayoutConstraint.activate(constraints)
    return constraints
  }

  /// Generate and activate an array of constraints for this type.
  ///
  /// Example usage:
  /// ```
  /// // someView: UIView
  /// // anotherView: UIView
  /// someView.constrain(
  ///   center(in: anotherView),
  ///   matchSize(of: anotherView.layoutMarginsGuide, multiplier: 0.5)
  /// )
  /// ```
  /// - Parameter factories: Some constraints factory or factories.
  /// - Important: invoking this method sets `translatesAutoresizingMaskIntoConstraints` to false!
  @inlinable
  @discardableResult
  public func constrain(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint] {
    let constraints = makeConstraints(factories)
    NSLayoutConstraint.activate(constraints)
    return constraints
  }

  /// Generate an array of constraints for this type.
  ///
  /// Use this function to generate costraints without activating them,
  /// for example when you need different sets of constraints for the same type:
  /// ```
  /// // someView: UIView
  /// let smallWidthLayout = someView.makeConstraints([
  ///   set(.width, to: 10),
  /// ])
  /// let largeWidthLayout = someView.makeConstraints([
  ///   set(.width, to: 100),
  /// ])
  /// ```
  /// - Parameter factories: An array of constraints factories.
  /// - Important: invoking this method sets `translatesAutoresizingMaskIntoConstraints` to false!
  @inlinable
  public func makeConstraints(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false
    return factories.flatMap { $0(self) }
  }

  /// Generate an array of constraints for this type.
  ///
  /// Use this function to generate costraints without activating them,
  /// for example when you need different sets of constraints for the same type:
  ///  ```
  ///  // someView: UIView
  ///  let smallWidthLayout = someView.makeConstraints(
  ///    set(.width, to: 10)
  ///  )
  ///  let largeWidthLayout = someView.makeConstraints(
  ///    set(.width, to: 100)
  ///  )
  ///  ```
  /// - Parameter factories: Some constraints factory or factories.
  /// - Important: invoking this method sets `translatesAutoresizingMaskIntoConstraints` to false!
  @inlinable
  public func makeConstraints(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false
    return factories.flatMap { $0(self) }
  }
}
