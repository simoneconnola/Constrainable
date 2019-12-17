import UIKit

/// An enumeration representing the constraint anchors for size.
///
/// Includes: *width, height*
public enum DimensionAnchor {

  case width, height

  @usableFromInline
  internal var keypath: KeyPath<Constrainable, NSLayoutDimension> {
    switch self {
    case .height:
      return \Constrainable.heightAnchor
    case .width:
      return \Constrainable.widthAnchor
    }
  }
}
