import Foundation

/// An enumeration representing the constraint anchors on the vertical axis.
///
/// Includes: *top, bottom, centerY, firstBaseline, lastBaseline*
public enum YAxisAnchor {
    case top, bottom, centerY, firstBaseline, lastBaseline

    internal var keypath: KeyPath<Constrainable, NSLayoutYAxisAnchor> {

        switch self {
        case .top:
            return \Constrainable.topAnchor
        case .bottom:
            return \Constrainable.bottomAnchor
        case .centerY:
            return \Constrainable.centerYAnchor
        case .firstBaseline:
            return \Constrainable.firstBaselineAnchor
        case .lastBaseline:
            return \Constrainable.lastBaselineAnchor
        }
    }
}
