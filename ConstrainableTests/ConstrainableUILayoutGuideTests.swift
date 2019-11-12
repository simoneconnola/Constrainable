import XCTest
@testable import Constrainable

class ConstrainableUILayoutGuideTests: XCTestCase {

  let view = UIView()
  var guide1: UILayoutGuide!
  var guide2: UILayoutGuide!

  override func setUp() {
    guide1 = UILayoutGuide()
    guide2 = UILayoutGuide()
    view.addLayoutGuide(guide1)
    view.addLayoutGuide(guide2)
  }

  override func tearDown() {
    view.removeLayoutGuide(guide1)
    view.removeLayoutGuide(guide2)
  }

  // MARK: - makeConstraints

  func testMakeConstraintsOnUILayoutGuideGeneratesAnArrayOfInactiveConstraints() {

    let expectedConstraints = [guide1.widthAnchor.constraint(equalTo: guide2.widthAnchor)]

    let variadic = guide1.makeConstraints(
      match(.width, of: guide2)
    )
    let array = guide1.makeConstraints([
      match(.width, of: guide2),
    ])

    XCTAssertTrue(testEquivalence(expectedConstraints, variadic))
    XCTAssertTrue(testEquivalence(expectedConstraints, array))
    XCTAssertTrue(testAllInactive(variadic))
    XCTAssertTrue(testAllInactive(array))
  }

  // MARK: - constrain

  func testConstrainOnUILayoutGuideGeneratesAnArrayOfActiveConstraints() {

    let expectedConstraints = [guide1.widthAnchor.constraint(equalTo: guide2.widthAnchor)]
    NSLayoutConstraint.activate(expectedConstraints)

    let variadic = guide1.constrain(
      match(.width, of: guide2)
    )
    let array = guide1.constrain([
      match(.width, of: guide2),
    ])

    variadic.forEach { $0.isActive = true }
    print(variadic)

    XCTAssertTrue(testEquivalence(expectedConstraints, variadic))
    XCTAssertTrue(testEquivalence(expectedConstraints, array))
    XCTAssertTrue(testAllActive(variadic))
    XCTAssertTrue(testAllActive(array))
  }
}
