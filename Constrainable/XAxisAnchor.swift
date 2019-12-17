import UIKit

/// An enumeration representing the constraint anchors on the horizontal axis.
///
/// Includes: *leading, trailing, left, right, centerX*
public enum XAxisAnchor {

  case leading, trailing, left, right, centerX

  @usableFromInline
  internal var keypath: KeyPath<Constrainable, NSLayoutXAxisAnchor> {
    switch self {
    case .leading:
      return \Constrainable.leadingAnchor
    case .trailing:
      return \Constrainable.trailingAnchor
    case .left:
      return \Constrainable.leftAnchor
    case .right:
      return \Constrainable.rightAnchor
    case .centerX:
      return \Constrainable.centerXAnchor
    }
  }
}
