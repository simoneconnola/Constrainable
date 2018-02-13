//
//  NSLayoutConstraint + multiplier.swift
//  Constrainable
//
//  Created by Simone Connola on 13/02/18.
//  Copyright © 2018 SimoneConnola. All rights reserved.
//

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
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier

        return newConstraint
    }
}
