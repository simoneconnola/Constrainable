import UIKit

/**
 A type that can be constrained with autolayout.

 Types that conform to Constrainable have all layout anchors for
 **dimension** and both **x and y axis**, and are able to generate and activate
 their own constraints from constraints factories.
 - Note: Default conforming types are `UIView` and `UILayoutGuide`.
 */
public protocol Constrainable {

  var widthAnchor: NSLayoutDimension { get }
  var heightAnchor: NSLayoutDimension { get }
  var topAnchor: NSLayoutYAxisAnchor { get }
  var bottomAnchor: NSLayoutYAxisAnchor { get }
  var leftAnchor: NSLayoutXAxisAnchor { get }
  var rightAnchor: NSLayoutXAxisAnchor { get }
  var leadingAnchor: NSLayoutXAxisAnchor { get }
  var trailingAnchor: NSLayoutXAxisAnchor { get }
  var centerXAnchor: NSLayoutXAxisAnchor { get }
  var centerYAnchor: NSLayoutYAxisAnchor { get }
  var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
  var lastBaselineAnchor: NSLayoutYAxisAnchor { get }

  // MARK: -

  /**
   Generate an array of constraints for this type.

   Use this function to generate costraints without activating them,
   for example when you need different sets of constraints for the same type:
   ```
   // someView: UIView
   let smallWidthLayout = someView.makeConstraints([
     set(.width, to: 10),
   ])
   let largeWidthLayout = someView.makeConstraints([
     set(.width, to: 100),
   ])
   ```
   - Parameter factories: An array of constraints factories.
   */
  func makeConstraints(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint]

  /**
   Generate an array of constraints for this type.

   Use this function to generate costraints without activating them,
   for example when you need different sets of constraints for the same type:
   ```
   // someView: UIView
   let smallWidthLayout = someView.makeConstraints(
     set(.width, to: 10)
   )
   let largeWidthLayout = someView.makeConstraints(
     set(.width, to: 100)
   )
   ```
   - Parameter factories: Some constraints factory or factories.
   */
  func makeConstraints(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint]

  /**
   Generate and activate an array of constraints for this type.

   Example usage:
   ```
   // someView: UIView
   // anotherView: UIView
   someView.constrain([
     matchCenter(of: anotherView),
     matchSize(of: anotherView.layoutMarginsGuide, multiplier: 0.5),
   ])
   ```
   - Parameter factories: An array of constraints factories.
   */
  @discardableResult
  func constrain(_ factories: [ConstraintsFactory]) -> [NSLayoutConstraint]

  /**
   Generate and activate an array of constraints for this type.

   Example usage:
   ```
   // someView: UIView
   // anotherView: UIView
   someView.constrain(
     matchCenter(of: anotherView),
     matchSize(of: anotherView.layoutMarginsGuide, multiplier: 0.5)
   )
   ```
   - Parameter factories: Some constraints factory or factories.
   */
  @discardableResult
  func constrain(_ factories: ConstraintsFactory...) -> [NSLayoutConstraint]
}
