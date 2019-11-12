import UIKit


func testEquivalence(
  _ expected: [NSLayoutConstraint],
  _ tested: [NSLayoutConstraint]
) -> Bool {
  guard expected.count == tested.count else { return false }
  return zip(expected, tested)
    .map { $0.isEquivalent($1) }
    .reduce(true) { $0 && $1 }
}

func testAllActive( _ constraints: [NSLayoutConstraint]) -> Bool {
  constraints.allSatisfy { $0.isActive == true }
}

func testAllInactive( _ constraints: [NSLayoutConstraint]) -> Bool {
  constraints.allSatisfy { $0.isActive == false }
}

extension NSLayoutConstraint {
  func isEquivalent(_ other: NSLayoutConstraint) -> Bool {
    return
      firstItem === other.firstItem &&
      secondItem === other.secondItem &&
      firstAnchor == other.firstAnchor &&
      secondAnchor == other.secondAnchor &&
      firstAttribute == other.firstAttribute &&
      secondAttribute == other.secondAttribute &&
      constant == other.constant &&
      multiplier == other.multiplier &&
      priority == other.priority &&
      identifier == other.identifier
  }
}
