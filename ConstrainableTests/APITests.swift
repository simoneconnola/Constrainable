
import XCTest
@testable import Constrainable

class APITests: XCTestCase {

  var view1: UIView!
  var view2: UIView!

  let standardCustomOptions = CustomOptions()

  override func setUp() {
    view1 = UIView()
    view2 = UIView()
  }

  // MARK: - Pin Horizontal Axis

  func testPinXAxisAnchorBetweenViewsWithDefaultOptions() {
    let constraints = pin(.top, to: .bottom, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasDefaultOptions(constraint)
  }

  func testPinXAxisAnchorBetweenViewsAndGuidesWithDefaultOptions() {
    let constraints = pin(.top, to: .bottom, of: view2.layoutMarginsGuide)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasDefaultOptions(constraint)
  }

  func testPinXAxisAnchorBetweenViewsWithCustomOptions() {
    let constraints = pin(
      .top,
      to: .bottom,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasCustomOptions(constraint)
  }

  func testPinXAxisAnchorBetweenViewsAndGuidesWithCustomOptions() {
    let constraints = pin(
      .top,
      to: .bottom,
      of: view2.layoutMarginsGuide,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Pin Vertical Axis

  func testPinYAxisAnchorBetweenViewsWithDefaultOptions() {
    let constraints = pin(.leading, to: .trailing, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasDefaultOptions(constraint)
  }

  func testPinYAxisAnchorBetweenViewsAndGuidesWithDefaultOptions() {
    let constraints = pin(.leading, to: .trailing, of: view2.layoutMarginsGuide)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasDefaultOptions(constraint)
  }

  func testPinYAxisAnchorBetweenViewsWithCustomOptions() {
    let constraints = pin(
      .leading,
      to: .trailing,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasCustomOptions(constraint)
  }

  func testPinYAxisAnchorBetweenViewsAndGuidesWithCustomOptions() {
    let constraints = pin(
      .leading,
      to: .trailing,
      of: view2.layoutMarginsGuide,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Match Dimensions

  func testMatchDimensionAnchorBetweenViewsWithDefaultOptions() {
    let constraints = match(.width, to: .height, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasDefaultOptions(constraint)
  }

  func testMatchDimensionAnchorBetweenViewsAndGuidesWithDefaultOptions() {
    let constraints = match(.width, to: .height, of: view2.layoutMarginsGuide)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasDefaultOptions(constraint)
  }

  func testMatchDimensionAnchorBetweenViewsWithCustomOptions() {
    let constraints = match(
      .width,
      to: .height,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasCustomOptions(constraint)
  }

  func testMatchDimensionAnchorBetweenViewsAndGuidesWithCustomOptions() {
    let constraints = match(
      .width,
      to: .height,
      of: view2.layoutMarginsGuide,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2.layoutMarginsGuide)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasCustomOptions(constraint)
  }
}

extension APITests {

  struct CustomOptions {
    var relation: NSLayoutConstraint.Relation = .lessThanOrEqual
    var offset: CGFloat = 10
    var multiplier: CGFloat = 10
    var priority: UILayoutPriority = .defaultHigh
    var identifier: String? = "someIdentifier"
  }

  func assertHasDefaultOptions(_ constraint: NSLayoutConstraint) {
    XCTAssertEqual(constraint.relation, .equal)
    XCTAssertEqual(constraint.constant, 0)
    XCTAssertEqual(constraint.multiplier, 1)
    XCTAssertEqual(constraint.priority, .required)
    XCTAssertEqual(constraint.identifier, nil)
  }

  func assertHasCustomOptions(_ constraint: NSLayoutConstraint, options: CustomOptions = CustomOptions()) {
    XCTAssertEqual(constraint.relation, options.relation)
    XCTAssertEqual(constraint.constant, options.offset)
    XCTAssertEqual(constraint.multiplier, options.multiplier)
    XCTAssertEqual(constraint.priority, options.priority)
    XCTAssertEqual(constraint.identifier, options.identifier)
  }
}
