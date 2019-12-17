import UIKit

/// A factory function that takes a Constrainable type and returns an array of NSLayoutConstraint.
/// - parameter constrainable: The type for wich to generate constraints.
/// - returns: An array of NSLayoutConstraint for the supplied type.
public typealias ConstraintsFactory = (_ constrainable: Constrainable) -> [NSLayoutConstraint]
