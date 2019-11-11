
import Foundation

extension NSLayoutConstraint {

    func withMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {

        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)

        newConstraint.priority = priority
        newConstraint.shouldBeArchived = shouldBeArchived
        newConstraint.identifier = identifier

        return newConstraint
    }
}
